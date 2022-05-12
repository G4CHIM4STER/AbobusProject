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

namespace Brylev.Contracts
{
	/// <summary>
	/// Логика взаимодействия для Contract.xaml
	/// </summary>
	public partial class Contract : Window
	{
		public Contract()
		{
			InitializeComponent();

			this.ClientBox.ItemsSource = Utilities.Utils.DataBase.Clients.Values;
		}

		private void ReturnButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, null, typeof(AllContracts));
		}

		private void SaveButton_Click(object sender, RoutedEventArgs e)
		{


			ReturnButton_Click(this, null);

			//TO DO
		}
	}
}
