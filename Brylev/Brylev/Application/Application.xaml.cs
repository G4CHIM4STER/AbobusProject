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
		}

		private void ReturnButton_Click(object sender, RoutedEventArgs e)
		{
			OpenAllRequests();
		}

		private void SaveButton_Click(object sender, RoutedEventArgs e)
		{
			OpenAllRequests();

			//TO DO
		}

		private void OpenAllRequests()
		{
			App.afterAuthorization.OpenNewWindow(this, null, typeof(Applications.AllApplications));
		}
	}
}
