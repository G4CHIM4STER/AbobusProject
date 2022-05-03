﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Brylev.Clients
{
	/// <summary>
	/// Логика взаимодействия для AllClients.xaml
	/// </summary>
	public partial class AllClients : Window
	{
		public AllClients()
		{
			InitializeComponent();

			using(SqlConnection connection = new SqlConnection(App.connectionParams))
			{
				connection.Open();

				string command = String.Format(Utilities.Utils.select, "Client");

				SqlDataAdapter sqlData = new SqlDataAdapter(command, connection);

				DataTable dataTable = new DataTable();
				sqlData.Fill(dataTable);

				//ClientsDataGrid.DataContext = dataTable;
				//Utilities.Utils.FitDataGridToContent(ClientsDataGrid);

				ClientsDataGrid.ItemsSource = dataTable.AsDataView();

			}

			//ClientsDataGrid.DataSource = dataTable;
		}
	}
}
