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
		public AllRequests()
		{
			InitializeComponent();
		}

		private void InsertButton_Click(object sender, RoutedEventArgs e)
		{
			this.RaiseEvent(e);
		}
	}
}
