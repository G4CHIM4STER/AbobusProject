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
using System.Reflection;

namespace Brylev.AfterAuthorization
{
	/// <summary>
	/// Логика взаимодействия для AfterAuthorization.xaml
	/// </summary>
	public partial class AfterAuthorization : Window
	{
		public AfterAuthorization()
		{
			InitializeComponent();
			OpenWindow += AfterAuthorization_OpenWindow;
		}

		private void AfterAuthorization_OpenWindow(object sender, RoutedEventArgs e)
		{
			if (sender.Equals(this.RequestsButton))
			{
				OpenChildWindow(new Requests.AllRequests());
			}
			else if(sender.GetType() == typeof(Requests.AllRequests))
			{
				OpenChildWindow(new Requests.Request());
			}
		}

		//private void RequestsButtonClick(object sender, RoutedEventArgs e)
		//{
		//	Requests.AllRequests allRequestsWindow = new Requests.AllRequests();
		//	object requestContent = allRequestsWindow.Content;
		//	allRequestsWindow.Content = null;

		//	this.ChildWindow.Children.Add(requestContent as UIElement);

		//	OpenChildWindow(this.RequestsButton);
		//}

		private void OpenChildWindow(Window window, string Data = null)
		{
			object requestContent = window.Content;
			window.Content = null;

			this.ChildWindow.Children.Add(requestContent as UIElement);
		}

		public delegate void OpenWindowHandler(object sender, RoutedEventArgs e);
		public static event OpenWindowHandler OpenWindow;
	}
}
