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

namespace Brylev.Equipment
{
	/// <summary>
	/// Логика взаимодействия для AllEquipment.xaml
	/// </summary>
	public partial class AllEquipment : Window
	{
		public AllEquipment()
		{
			InitializeComponent();

			//string command = String.Format(Utilities.Utils.select, "Equipment");

			string table = "Equipments";

			Utilities.Utils.FillDataGrid(this.EquipmentsDataGrid, table);
			this.InsertButton.Click += InsertButton_Click;

		}
		private void InsertButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, e, typeof(Equipment));
		}
	}
}
