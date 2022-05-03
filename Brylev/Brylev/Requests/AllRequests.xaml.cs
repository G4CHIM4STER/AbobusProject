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

namespace Brylev.Requests
{
	/// <summary>
	/// Логика взаимодействия для AllRequests.xaml
	/// </summary>
	public partial class AllRequests : Window
	{
		//AfterAuthorization.AfterAuthorization afterAuthorization;

		public AllRequests()
		{
			InitializeComponent();
			//afterAuthorization = App.afterAuthorization;

			//FindParentWindow();
		}

		private void InsertButton_Click(object sender, RoutedEventArgs e)
		{
			App.afterAuthorization.OpenNewWindow(this, e, typeof(Requests.Request));
		}

		//private void FindParentWindow()
		//{
		//	afterAuthorization = (AfterAuthorization.AfterAuthorization)Utilities.Utils.GetWindowInstance(typeof(AfterAuthorization.AfterAuthorization));
		//}
	}
}
