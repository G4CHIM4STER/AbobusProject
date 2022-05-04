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
	/// Логика взаимодействия для AllRequests.xaml
	/// </summary>
	public partial class AllApplications : Window
	{
		public AllApplications()
		{
			InitializeComponent();

			//string command = String.Format(Utilities.Utils.select, "Application");
			string table = "Applications";

			Utilities.Utils.FillDataGrid(this.ApplicationsDataGrid, table);
		}

		private void InsertButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, e, typeof(Applications.Application));
		}
	}
}
