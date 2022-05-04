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
	public partial class App : Application
	{
		public static AfterAuthorization.AfterAuthorization afterAuthorization;
		
		public static string database = @"(localdb)\MSSQLLocalDB";
		public static string connectionParams = $"Persist Security Info = False; Integrated Security = true; Initial Catalog = AbobusDB; Server = {database}";
		
		public static SqlConnection sqlConnection = new SqlConnection(App.connectionParams);
		
		public App()
		{
			//try
			//{
			//	sqlConnection.Open();
			//}
			//catch (Exception)
			//{
			//	throw;
			//}
		}
	}
}
