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
    /// Логика взаимодействия для Contract.xaml
    /// </summary>
    public partial class Contract : Window
    {
        public Contract()
        {
            InitializeComponent();

            string table = "Docs";

            Utilities.Utils.FillDataGrid(this.Contract_Data, table);
        }
    }
}
