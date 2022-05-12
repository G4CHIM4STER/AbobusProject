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
	/// Логика взаимодействия для AllContracts.xaml
	/// </summary>
	public partial class AllContracts : Window
	{
		public AllContracts()
		{
			InitializeComponent();

			//string command = String.Format(Utilities.Utils.select, "Agreement");
			string table = "Contracts";

			Utilities.Utils.FillDataGrid(this.ContractsDataGrid, table);
			this.InsertButton.Click += InsertButton_Click;

		}

		private void InsertButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, e, typeof(Contract));
		}
	}
}
