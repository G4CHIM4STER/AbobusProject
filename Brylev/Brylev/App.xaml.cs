using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Data.SqlClient;

namespace Brylev
{
	/// <summary>
	/// Логика взаимодействия для App.xaml
	/// </summary>
	public partial class App : System.Windows.Application
	{
		public static AfterAuthorization.AfterAuthorization afterAuthorization;
		
		public static string database = @"(localdb)\MSSQLLocalDB";
		public static string connectionParams = $"Persist Security Info = False; Integrated Security = true; Initial Catalog = AbobusDB; Server = {database}";
		
		public App()
		{

		}

		public class DataBase
		{
			//public Dictionary<int,string> 
		}
	}
}
