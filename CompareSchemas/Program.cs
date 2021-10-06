using System;
using System.Diagnostics;
using Microsoft.Extensions.Configuration;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace CompareSchemas
{
    class Program
    {
        protected static IConfiguration Configuration { get; set; }

        public string HostToCompare { get; set; }

        static void Main(string[] args)
        {
            Configuration = new ConfigurationBuilder()
                .AddJsonFile("appSettings.json", optional: true, reloadOnChange: true)
                .AddEnvironmentVariables()
                .AddCommandLine(args)
                .Build();

            Console.WriteLine();
            Console.WriteLine("******************** SCHEMA COMPARISON ********************");
            Console.WriteLine();
            Console.WriteLine($"Schema you input will compare with source {Configuration.GetSection("SourceSchema").Value} (host: {Configuration.GetSection("SourceHost").Value})");
            Console.WriteLine();

            ConsoleKeyInfo key;

            do
            {
                Console.WriteLine("Input Target Host...");
                var targetHost = Console.ReadLine();

                Console.WriteLine("Input User...");
                var username = Console.ReadLine();

                Console.WriteLine("Input Password...");
                var password = Console.ReadLine(); 
                // var password = ReadPassword();

                CompareSchema(targetHost, username, password);

                Console.Write("Press ESCAPE to exit, any key to generate another comparison...");
                key = Console.ReadKey();
                Console.WriteLine();
            }
            while (key.Key != ConsoleKey.Escape);
        }

        private static string ReadPassword()
        {
            System.Console.Write("password: ");
            string password = null;
            while (true)
            {
                var key = System.Console.ReadKey(true);
                if (key.Key == ConsoleKey.Enter)
                    break;
                password += key.KeyChar;
            }

            return password;
        }

        public static void CompareSchema(string pTargetHost, string pUserHost, string pPasswordHost)
        {
            string connStr = $"Host={pTargetHost}; user id={pUserHost}; password={pPasswordHost};Ssl Mode=none;";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "show schemas;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                Console.WriteLine("Schema founded: ");
                while (rdr.Read())
                {
                    var CurrentSchema = rdr[0].ToString();

                    if (!bool.Parse(Configuration.GetSection("OnlyTest").Value) || CurrentSchema.EndsWith("test"))
                    {
                        var args = "/schemacompare " +
                           $"/source connection:\"Host={Configuration.GetSection("SourceHost").Value}; Database=schema_zero; user id=dba; password=dba;\" " +
                           $"/target connection:\"Host={pTargetHost}; Database={CurrentSchema}; user id={pUserHost}; password={pPasswordHost}\" " +
                            "/ForceColumnOrder:No " +
                            "/IgnoreComments:Yes " +
                            "/IgnoreCollationsAndCharacterSets:Yes " +
                           $"/log:\"C:\\Users\\matteo.piazzi\\Documents\\Devart\\Comparisons\\{pTargetHost}_{CurrentSchema}_log.log\" " +
                           $"/sync:\"C:\\Users\\matteo.piazzi\\Documents\\Devart\\Comparisons\\{pTargetHost}_{CurrentSchema}.sql\"";
                        
                        Console.WriteLine("\"C:\\Program Files\\Devart\\dbForge Studio for MySQL\\dbforgemysql.com\" " + args);

                        ExecuteComparison(args);
                    }
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            conn.Close();
            Console.WriteLine("Done.");
            Console.WriteLine();
            Console.WriteLine("************************************************");
            Console.WriteLine();
        }

        private static void ExecuteComparison(string args)
        {
            Process process = new Process();
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.WindowStyle = ProcessWindowStyle.Normal;
            startInfo.FileName = @"C:\Program Files\Devart\dbForge Studio for MySQL\dbforgemysql.com";
            startInfo.CreateNoWindow = false;
            startInfo.Arguments = args;
            process.StartInfo = startInfo;
            process.Start();

            process.WaitForExit();
        }
    }
}
