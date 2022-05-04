﻿using System;
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

namespace Brylev.MainWindow
{
	/// <summary>
	/// Логика взаимодействия для MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}

		private void AuthorizeButton_Click(object sender, RoutedEventArgs e)
		{
			AfterAuthorization.AfterAuthorization afterAuthorization = new AfterAuthorization.AfterAuthorization();

			this.Hide();
			afterAuthorization.Show();

			afterAuthorization.Closing += AfterAuthorization_Closed;
		}

		private void AfterAuthorization_Closed(object sender, EventArgs e)
		{
			base.OnClosed(e);

			Application.Current.Shutdown();
		}
	}
}
