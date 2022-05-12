using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Brylev.Utilities
{
	public class Utils
	{
		public static string select = "SELECT * FROM {0}";
		public static string insert = "INSERT INTO {0} VALUES({1})";
		public static string update = "UPDATE {0} SET {1} WHERE {2}";
		public static string SelectScheduleDoc = "SelectScheduleDocById";
		public static string SelectMatchingIdName = "SelectMatchingIdName";

		public struct DataBase
		{
			public static Dictionary<int, string> Applications;
			public static Dictionary<int, string> ApplicationTypes;
			public static Dictionary<int, string> Clients;
			public static Dictionary<int, string> ContractList;
			public static Dictionary<int, string> Contracts;
			public static Dictionary<int, string> Docs;
			public static Dictionary<int, string> Employees;
			public static Dictionary<int, string> Equipments;
			public static Dictionary<int, string> Positions;
			public static Dictionary<int, string> Regions;
			public static Dictionary<int, string> Roles;
			public static Dictionary<int, string> Rooms;
			public static Dictionary<int, string> Services;
			public static Dictionary<int, string> Statuses;
			public static Dictionary<int, string> Works;

			internal void GetMatchingData()
			{
				DataBase.Applications = SelectMatchingDataFromDB("Applications");
				DataBase.ApplicationTypes = SelectMatchingDataFromDB("ApplicationTypes");
				DataBase.Clients = SelectMatchingDataFromDB("Clients");
				DataBase.ContractList = SelectMatchingDataFromDB("ContractList");
				DataBase.Contracts = SelectMatchingDataFromDB("Contracts");
				DataBase.Docs = SelectMatchingDataFromDB("Docs");
				DataBase.Employees = SelectMatchingDataFromDB("Employees");
				DataBase.Equipments = SelectMatchingDataFromDB("Equipments");
				DataBase.Positions = SelectMatchingDataFromDB("Positions");
				DataBase.Regions = SelectMatchingDataFromDB("Regions");
				DataBase.Roles = SelectMatchingDataFromDB("Roles");
				DataBase.Rooms = SelectMatchingDataFromDB("Rooms");
				DataBase.Services = SelectMatchingDataFromDB("Services");
				DataBase.Statuses = SelectMatchingDataFromDB("Statuses");
				DataBase.Works = SelectMatchingDataFromDB("Works");
			}
		}
		public struct Data
		{
			public string equip_id;
			public string contract_id;
			public string equip_name;
			public string serial_number;
			public string equip_plan_quantity;
			public string time_start;
			public string time_end;
			public string client_name;
			public string equip_actual_quantity;

			public void SetData(SqlDataReader reader)
			{
				equip_id = reader.GetValue(0).ToString();
				contract_id = reader.GetValue(1).ToString();
				equip_name = reader.GetValue(2).ToString();
				serial_number = reader.GetValue(3).ToString();
				equip_plan_quantity = reader.GetValue(4).ToString();
				time_start = reader.GetValue(5).ToString();
				time_end = reader.GetValue(6).ToString();
				client_name = reader.GetValue(7).ToString();
				equip_actual_quantity = reader.GetValue(8).ToString();
			}
		}

		public static Window GetWindowInstance(Type T)
		{
			var windows = System.Windows.Application.Current.Windows;

			if (windows.Count != 0)
			{
				foreach (var window in windows)
				{
					if (window.GetType().Equals(T))
					{
						return (Window)window;
					}
				}
			}

			return null;
		}
		public static void HighlightButton(System.Windows.Controls.Primitives.ButtonBase button)
		{
			BrushConverter converter = new BrushConverter();
			Brush brush = (Brush)converter.ConvertFrom("#FFFAD7AC");
			brush.Freeze();
			button.Background = brush;
		}
		public static void ResetButtonColor(System.Windows.Controls.Primitives.ButtonBase button)
		{
			BrushConverter converter = new BrushConverter();
			Brush brush = (Brush)converter.ConvertFrom("#FFDAE8FC");
			brush.Freeze();
			button.Background = brush;
		}
		public static void FillDataGrid(DataGrid dataGrid, string table)
		{
			try
			{
				using (SqlConnection connection = new SqlConnection(App.connectionParams))
				{
					connection.Open();

					string command = String.Format(Utilities.Utils.select, table);

					SqlDataAdapter sqlData = new SqlDataAdapter(command, connection);

					DataTable dataTable = new DataTable();
					sqlData.Fill(dataTable);

					//ClientsDataGrid.DataContext = dataTable;
					//Utilities.Utils.FitDataGridToContent(ClientsDataGrid);

					dataGrid.ItemsSource = dataTable.AsDataView();

				}
			}
			catch (Exception)
			{

				throw;
			}


			//ClientsDataGrid.DataSource = dataTable;
		}
		public static void InsertDataIntoDB(string table, List<string> insertData) //Dictionary<string, string> dataColumnPairs)
		{
			StringBuilder values = new StringBuilder();

			try
			{
				int i = 0;
				foreach (var data in insertData)
				{
					i++;

					values.Append(data);

					if (insertData.Count < i)
					{
						values.Append(", ");
					}
				}

				string command = String.Format(insert, table, values);

				using (SqlConnection connection = new SqlConnection(App.connectionParams))
				{
					connection.Open();

					SqlCommand sqlCommand = new SqlCommand(command, connection);

					sqlCommand.ExecuteNonQuery();
				}
			}
			catch (Exception)
			{
				throw;
			}

		}
		public static void UpdateDataIntoDB(string table, string condition, List<string> updatedData)
		{
			StringBuilder values = new StringBuilder();

			try
			{
				int i = 0;
				foreach (var data in updatedData)
				{
					i++;

					values.Append(data);

					if (updatedData.Count < i)
					{
						values.Append(", ");
					}
				}

				string command = String.Format(update, table, condition, values);

				using (SqlConnection connection = new SqlConnection(App.connectionParams))
				{
					connection.Open();

					SqlCommand sqlCommand = new SqlCommand(command, connection);

					sqlCommand.ExecuteNonQuery();
				}
			}
			catch (Exception)
			{
				throw;
			}
		}
		//public static Dictionary<string, string> SelectScheduleDocById(int @idcontract)
		//{
		//	using (SqlConnection connection = new SqlConnection(App.connectionParams))
		//	{
		//		connection.Open();

		//		SqlCommand sqlCommand = new SqlCommand(SelectScheduleDoc, connection);
		//		sqlCommand.CommandType = CommandType.StoredProcedure;

		//		SqlParameter @id_contract = new SqlParameter("@id_contract", @idcontract);
		//		sqlCommand.Parameters.Add(@id_contract);

		//		SqlDataReader reader = sqlCommand.ExecuteReader();
		//		Dictionary<string, string> result = new Dictionary<string, string>();

		//		while (reader.Read())
		//		{
		//			result.Add(reader.GetName(0).ToString(), reader.GetValue(0).ToString());
		//			result.Add(reader.GetName(1).ToString(), reader.GetValue(1).ToString());
		//			result.Add(reader.GetName(2).ToString(), reader.GetValue(2).ToString());
		//			result.Add(reader.GetName(3).ToString(), reader.GetValue(3).ToString());
		//			result.Add(reader.GetName(4).ToString(), reader.GetValue(4).ToString());
		//			result.Add(reader.GetName(5).ToString(), reader.GetValue(5).ToString());
		//		}

		//		return result;
		//	}
		//}
		public static List<Data> SelectSchedulePlanById(int @idcontract, DateTime @startyear)
		{
			//@startyear = DateTime.Parse("01.01.2022");

			using (SqlConnection connection = new SqlConnection(App.connectionParams))
			{
				connection.Open();

				SqlCommand sqlCommand = new SqlCommand(SelectScheduleDoc, connection);
				sqlCommand.CommandType = CommandType.StoredProcedure;

				SqlParameter @id_contract = new SqlParameter("@id_contract", @idcontract);
				SqlParameter @start_year = new SqlParameter("@start_year", @startyear.ToString("dd.MM.yyyy HH:mm:ss.fff"));

				sqlCommand.Parameters.AddRange(new SqlParameter[] { @id_contract, @start_year });
				List<Data> result = new List<Data>();

				SqlDataReader reader = sqlCommand.ExecuteReader();
				//string data = "";

				while (reader.Read())
				{
					Data data = new Data();
					data.SetData(reader);
					result.Add(data);
				}

				return result;
			}
		}
		public static Dictionary<int, string> SelectMatchingDataFromDB(string _table)
		{
			Dictionary<int, string> matchIdNames = new Dictionary<int, string>();

			using (SqlConnection connection = new SqlConnection(App.connectionParams))
			{
				connection.Open();

				SqlCommand sqlCommand = new SqlCommand(SelectMatchingIdName, connection);
				sqlCommand.CommandType = CommandType.StoredProcedure;

				SqlParameter @table = new SqlParameter("@table", _table);

				sqlCommand.Parameters.Add(@table);

				SqlDataReader reader = sqlCommand.ExecuteReader();

				Dictionary<int, string> result = new Dictionary<int, string>();
				while (reader.Read())
				{
					//DataBase.MatchIdName idName = new DataBase.MatchIdName();
					//idName.SetData(reader.GetValue(0).ToString(), reader.GetValue(1).ToString());
					string id = reader.GetValue(0).ToString();
					string name = reader.GetValue(1).ToString();
					result.Add(Convert.ToInt32(reader.GetValue(0)),reader.GetValue(1).ToString());
				}

				return result;
			}
		}
	}
}
