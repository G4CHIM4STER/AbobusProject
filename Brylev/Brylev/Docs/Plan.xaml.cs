using System;
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

namespace Brylev.Docs
{
	/// <summary>
	/// Логика взаимодействия для Plan.xaml
	/// </summary>
	public partial class Plan : Window
	{
		public Plan()
		{
			InitializeComponent();

			this.ContractComboBox.ItemsSource = Utilities.Utils.DataBase.Contracts.Keys;

			this.YearDatePicker.SelectedDate = DateTime.Now;
			this.ContractComboBox.DataContext = 1;
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				var date = YearDatePicker.DisplayDate;
				string dateText = date.ToString("yyyy");
				Docs.PlanDoc planDoc = new PlanDoc(dateText, Utilities.Utils.SelectSchedulePlanById(Convert.ToInt32(this.ContractComboBox.Text), date));

				planDoc.ShowDialog();
			}
			catch
			{
				MessageBox.Show("Произошла ошибка! Либо не введены все данные!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error, MessageBoxResult.OK);
			}
		}
	}
}
