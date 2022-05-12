using System;
using System.Collections.Generic;
using System.Data;
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
	/// Логика взаимодействия для PlanDoc.xaml
	/// </summary>
	public partial class PlanDoc : Window
	{
		List<Utilities.Utils.Data> plan;
		static string date = "";
		static string client = "";
		static string clientName = "технического обслуживания клиента '{0}' на {1} год";

		public PlanDoc()
		{
			InitializeComponent();
		}

		public PlanDoc(List<Utilities.Utils.Data> planInfo) : this()
		{
			ShowData(planInfo);
			this.SizeToContent = SizeToContent.WidthAndHeight;
		}

		public PlanDoc(string date, List<Utilities.Utils.Data> planInfo) : this(planInfo)
		{
			PlanDoc.date = date;
			this.ClientBox.Text = String.Format(clientName, PlanDoc.client, date);
		}

		private void ShowData(List<Utilities.Utils.Data> planInfo)
		{
			this.plan = planInfo;

			DataTable data = new DataTable();

			data.Columns.Add("Оборудование");
			data.Columns.Add("Серийный номер");
			data.Columns.Add("Планируется (ежемесячно)");
			data.Columns.Add("Январь");
			data.Columns.Add("Февраль");
			data.Columns.Add("Март");
			data.Columns.Add("Апрель");
			data.Columns.Add("Май");
			data.Columns.Add("Июнь");
			data.Columns.Add("Июль");
			data.Columns.Add("Август");
			data.Columns.Add("Сентябрь");
			data.Columns.Add("Октябрь");
			data.Columns.Add("Ноябрь");
			data.Columns.Add("Декабрь");

			foreach (var tuple in planInfo)
			{
				if(PlanDoc.client == "")
					PlanDoc.client = tuple.client_name;

				List<string> parsedCount = ParseData(tuple.equip_actual_quantity);
				data.Rows.Add(tuple.equip_name, tuple.serial_number, tuple.equip_plan_quantity, 
					parsedCount[0], parsedCount[1], parsedCount[2], parsedCount[3], 
					parsedCount[4], parsedCount[5], parsedCount[6], parsedCount[7], 
					parsedCount[8], parsedCount[9], parsedCount[10], parsedCount[11]);
			}

			this.PlanDataGrid.ItemsSource = data.DefaultView;
			this.PlanDataGrid.ColumnWidth = DataGridLength.Auto;
		}

		private List<string> ParseData(string tryparse)
		{
			List<string> result = new List<string>();

			string[] date_plan = tryparse.Split(',');

			for (int i = 0; i < date_plan.Length; i++)
			{
				string[] temp = date_plan[i].Split(':');
				result.Add(temp[1]);
			}

			return result;
		}
	}
}
