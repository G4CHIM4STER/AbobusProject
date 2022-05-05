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
	/// Логика взаимодействия для AllServices.xaml
	/// </summary>
	public partial class AllServices : Window
	{
		public AllServices()
		{
			InitializeComponent();

			string table = "Services";

			Utilities.Utils.FillDataGrid(this.ServicesDataGrid, table);
		}
	}
}
