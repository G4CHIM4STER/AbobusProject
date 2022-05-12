using System;
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

namespace Brylev.Employees
{
	/// <summary>
	/// Логика взаимодействия для Employee.xaml
	/// </summary>
	public partial class Employee : Window
	{
		public Employee()
		{
			InitializeComponent();

			this.ClientBox.ItemsSource = Utilities.Utils.DataBase.Clients.Values;
			this.RegionBox.ItemsSource = Utilities.Utils.DataBase.Regions.Values;
			this.RoleBox.ItemsSource = Utilities.Utils.DataBase.Roles.Values;
		}

		private void ReturnButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, null, typeof(AllEmployees));
		}

		private void SaveButton_Click(object sender, RoutedEventArgs e)
		{


			ReturnButton_Click(this, null);

			//TO DO
		}
	}
}
