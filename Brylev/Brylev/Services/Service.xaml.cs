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

namespace Brylev.Services
{
	/// <summary>
	/// Логика взаимодействия для Service.xaml
	/// </summary>
	public partial class Service : Window
	{
		public Service()
		{
			InitializeComponent();
		}

		private void ReturnButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, null, typeof(AllServices));
		}

		private void SaveButton_Click(object sender, RoutedEventArgs e)
		{


			ReturnButton_Click(this, null);

			//TO DO
		}
	}
}
