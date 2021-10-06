using DbUp;
using DbUp.Engine;
using DbUp.Engine.Output;
using DbUp.Engine.Transactions;
using DbUp.MySql;
using DbUp.Support;
using Microsoft.Extensions.Configuration;
using System;
using System.Configuration;

namespace TestConsole
{
    public static class DBMigrations
    {
        public static void DatabaseMigration(IConfiguration Configuration)
        {
            // UpgradeEngine upgrader = DeployChanges.To
            //         .MySqlDatabase(connectionString)
            //         .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
            //         // .LogToNowhere()
            //         .LogToConsole()
            //         .Build();

            string connectionString = Configuration.GetConnectionString("local");

            // If have to create new database
            EnsureDatabase.For.MySqlDatabase(connectionString);

            var a = DeployChanges.To
                    .MySqlDatabase(connectionString)
                    // .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly());
                    .WithScriptsFromFileSystem(@"C:\Users\matteo.piazzi\Documents\Source\TestConsole\TestConsole\Scripts")
                    .WithTransactionPerScript();

            // Definizione di una tabella di versionamento custom
            MySqlTableJournal _t = new MySqlTableJournal(() => a.BuildConfiguration().ConnectionManager, () => a.BuildConfiguration().Log, "dbup", "db_version");
            UpgradeEngine upgrader = a.JournalTo(_t).LogToConsole().Build();

            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
#if DEBUG
             // Console.ReadLine();
#endif
            }
        }
    }

    /// <summary>
    /// An implementation of the <see cref="IJournal"/> interface which tracks version numbers for a 
    /// MySql database using a table called SchemaVersions.
    /// </summary>
    public class MySqlTableJournal : TableJournal
    {
        /// <summary>
        /// Creates a new MySql table journal.
        /// </summary>
        /// <param name="connectionManager">The MySql connection manager.</param>
        /// <param name="logger">The upgrade logger.</param>
        /// <param name="schema">The name of the schema the journal is stored in.</param>
        /// <param name="table">The name of the journal table.</param>
        public MySqlTableJournal(Func<IConnectionManager> connectionManager, Func<IUpgradeLog> logger, string schema, string table)
            : base(connectionManager, logger, new MySqlObjectParser(), schema, table)
        {
        }

        protected override string GetInsertJournalEntrySql(string @scriptName, string @applied)
        {
            return $"insert into {FqSchemaTableName} (script_version, applied) values ({@scriptName}, {@applied})";
        }

        protected override string GetJournalEntriesSql()
        {
            return $"select script_version from {FqSchemaTableName} order by script_version";
        }

        protected override string CreateSchemaTableSql(string quotedPrimaryKeyName)
        {
            return
$@"CREATE TABLE {FqSchemaTableName} 
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `script_version` VARCHAR(100) NOT NULL,
    `applied` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`)
);";
        }
    }
}
