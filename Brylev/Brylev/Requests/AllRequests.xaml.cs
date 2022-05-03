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
		static AfterAuthorization.AfterAuthorization AfterAuthorization;

		public AllRequests()
		{
			InitializeComponent();
			//AfterAuthorization.AfterAuthorization.OpenWindow += InsertButton_Click;
			var windows = Application.Current.Windows;

			if (windows != null)
			{
				foreach (var window in windows)
				{
					if (window.GetType().Equals(typeof(AfterAuthorization.AfterAuthorization)))
					{
						AfterAuthorization = (AfterAuthorization.AfterAuthorization)window;
						//afterAuthorization.Close();
						AfterAuthorization.OpenWindow += InsertButton_Click;
						break;
					}
				}
			}
		}

		private void InsertButton_Click(object sender, RoutedEventArgs e)
		{
			AfterAuthorization.OpenNewWindow(this, e);
		}
	}
}
