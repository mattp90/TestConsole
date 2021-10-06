using Microsoft.Extensions.Configuration;
using System;

namespace TestConsole
{
    public delegate void TaskCompletedCallBack(string taskResult);

    public class Program
    {
        protected static IConfiguration Configuration { get; set; }
        private static string[] _AsciiChars = { "▒", "▒", "░", "#", "#", "@", "$", "ò", "%", "?", "=", "+", "*", "*", ":", ":", "-", "-", ".", " " };
        //private static string[] _AsciiChars = { "#", "#", "@", "%", "=", "+", "*", ":", "-", ".", "&nbsp;" };

        static void Main(string[] args)
        {
            Configuration = new ConfigurationBuilder()
                .AddJsonFile("appSettings.json", optional: true, reloadOnChange: true)
                .AddEnvironmentVariables()
                .AddCommandLine(args)
                .Build();


            if (args.Length > 0)
            {
                switch (args[0].ToLower())
                {
                    case "update-db":
                        DBMigrations.DatabaseMigration(Configuration);
                        break;
                    default:
                        {
                            Console.WriteLine("Operation not recognized");
                        }
                        break;
                }
            }
            else
            {
                ConsoleKeyInfo key;
                Console.WriteLine("Select a command...");
                Console.WriteLine("\t1 Migration database");
                Console.WriteLine("");
                Console.WriteLine("(ESC) to exit...");

                key = Console.ReadKey();

                Console.WriteLine("");

                while (key.Key != ConsoleKey.Escape)
                {
                    switch (key.KeyChar)
                    {
                        case '1':
                            Console.WriteLine("***** Starting Database migration *****");
                            DBMigrations.DatabaseMigration(Configuration);
                            Console.WriteLine("");
                            Console.WriteLine("***** Database migration ends *****");
                            Console.WriteLine("Select a command...");
                            Console.WriteLine("(ESC) to exit...");
                            break;
                        default:
                            Console.WriteLine("");
                            Console.WriteLine("Command selected does not exist.");
                            Console.WriteLine("Select a command...");
                            Console.WriteLine("(ESC) to exit...");
                            break;
                    }

                    key = Console.ReadKey();
                }
            }
        }
    }
}
