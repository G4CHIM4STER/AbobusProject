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
	/// Логика взаимодействия для AllReports.xaml
	/// </summary>
	public partial class AllDocs : Window
	{
		public AllDocs()
		{
			InitializeComponent();
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			if(sender == this.ContractButton)
			{
				App.afterAuthorization.OpenNewWindow(this, e, typeof(Contracts.AllContracts));
			}
			else if(sender == this.PlanButton)
			{
				App.afterAuthorization.OpenNewWindow(this, e, typeof(Docs.Plan));
			}
		}
	}
}
