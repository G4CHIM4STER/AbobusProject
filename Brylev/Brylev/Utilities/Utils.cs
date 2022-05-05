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

		//public static void FitDataGridToContent(DataGrid dg)
		//{
		//	int t = 0;
		//	foreach (DataGridColumn column in dg.Columns)
		//	{
		//		//if you want to size your column as per the cell content
		//		//column.Width = new DataGridLength(1.0, DataGridLengthUnitType.SizeToCells);
		//		//if you want to size your column as per the column header
		//		//column.Width = new DataGridLength(1.0, DataGridLengthUnitType.SizeToHeader);
		//		//if you want to size your column as per both header and cell content
		//		//column.Width = new DataGridLength(1.0, DataGridLengthUnitType.Auto);
		//	}
		//}
	}
}
