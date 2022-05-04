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

namespace Brylev.Agreements
{
	/// <summary>
	/// Логика взаимодействия для AllContracts.xaml
	/// </summary>
	public partial class AllAgreements : Window
	{
		public AllAgreements()
		{
			InitializeComponent();

			//string command = String.Format(Utilities.Utils.select, "Agreement");
			string table = "Agreement";

			Utilities.Utils.FillDataGrid(this.AgreementsDataGrid, table);
		}
	}
}