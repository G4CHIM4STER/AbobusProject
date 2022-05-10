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
	internal class Utils
	{
		public static string select = "SELECT * FROM {0}";
		public static string insert = "INSERT INTO {0} ({1}) VALUES({2})";
		public static string SelectScheduleDoc = "SelectScheduleDocById";
		public static string SelectSchedulePlan = "SelectSchedulePlanById";
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
		public static void InsertDataIntoDB(string table, Dictionary<string, string> dataColumnPairs)
		{
			StringBuilder columns = new StringBuilder();
			StringBuilder values = new StringBuilder();
			int i = 0;

			try
			{
				foreach (var pair in dataColumnPairs)
				{
					i++;

					columns.Append(pair.Key);
					values.Append(pair.Value);

					if (dataColumnPairs.Count < i)
					{
						columns.Append(", ");
						values.Append(", ");
					}
				}

				string command = String.Format(insert, table, columns, values);

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
		public static Dictionary<string, string> SelectScheduleDocById(int @idcontract)
		{
			using (SqlConnection connection = new SqlConnection(App.connectionParams))
			{
				connection.Open();

				SqlCommand sqlCommand = new SqlCommand(SelectScheduleDoc, connection);
				sqlCommand.CommandType = CommandType.StoredProcedure;

				SqlParameter @id_contract = new SqlParameter("@id_contract", @idcontract);
				sqlCommand.Parameters.Add(@id_contract);

				SqlDataReader reader = sqlCommand.ExecuteReader();
				Dictionary<string, string> result = new Dictionary<string, string>();

				while (reader.Read())
				{
					result.Add(reader.GetName(0).ToString(), reader.GetValue(0).ToString());
					result.Add(reader.GetName(1).ToString(), reader.GetValue(1).ToString());
					result.Add(reader.GetName(2).ToString(), reader.GetValue(2).ToString());
					result.Add(reader.GetName(3).ToString(), reader.GetValue(3).ToString());
					result.Add(reader.GetName(4).ToString(), reader.GetValue(4).ToString());
					result.Add(reader.GetName(5).ToString(), reader.GetValue(5).ToString());
				}

				return result;
			}
		}
		public static Dictionary<string, string> SelectSchedulePlanById(int @idcontract, DateTime @periodstart, DateTime @periodend)
		{
			using (SqlConnection connection = new SqlConnection(App.connectionParams))
			{
				connection.Open();

				SqlCommand sqlCommand = new SqlCommand(SelectSchedulePlan, connection);
				sqlCommand.CommandType = CommandType.StoredProcedure;

				SqlParameter @id_contract = new SqlParameter("@id_contract", @idcontract);
				SqlParameter @periodStart = new SqlParameter("@periodStart", @periodstart.ToString("dd.MM.yyyy HH:mm:ss.fff"));
				SqlParameter @periodEnd = new SqlParameter("@periodEnd", @periodend.ToString("dd.MM.yyyy HH:mm:ss.fff"));

				sqlCommand.Parameters.AddRange(new SqlParameter[] { @id_contract, @periodStart, @periodEnd });
				Dictionary<string, string> result = new Dictionary<string, string>();

				SqlDataReader reader = sqlCommand.ExecuteReader();
				string data = "";

				while (reader.Read())
				{
					data = reader.GetValue(0).ToString();
				}

				string[] param = data.Split(',');

				for (int i = 0; i < param.Length; i++)
				{
					string[] temp = param[i].Split('-');
					result.Add(temp[0], temp[1]);
				}

				return result;
			}
		}
	}
}
