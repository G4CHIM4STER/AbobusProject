using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

namespace Brylev.Applications
{
	/// <summary>
	/// Логика взаимодействия для Request.xaml
	/// </summary>
	public partial class Application : Window
	{

		public Application()
		{
			InitializeComponent();

			this.ApplicationTypeBox.ItemsSource = Utilities.Utils.DataBase.ApplicationTypes.Values;
			this.ClientBox.ItemsSource = Utilities.Utils.DataBase.Clients.Values;
			this.ContractBox.ItemsSource = Utilities.Utils.DataBase.Contracts.Values;
			this.EmployeeBox.ItemsSource = Utilities.Utils.DataBase.Employees.Values;
			this.RoomBox.ItemsSource = Utilities.Utils.DataBase.Rooms.Values;
			this.StatusBox.ItemsSource = Utilities.Utils.DataBase.Statuses.Values;
			this.EquipmentBox.ItemsSource = Utilities.Utils.DataBase.Equipments.Values;
		}

		private void ReturnButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, null, typeof(Applications.AllApplications));
		}

		private void SaveButton_Click(object sender, RoutedEventArgs e)
		{


			ReturnButton_Click(this, null);

			//TO DO
		}
	}
}
