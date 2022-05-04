using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Brylev.Utilities
{
	internal class Utils
	{
		public static string select = "SELECT * FROM {0}";
		public static Window GetWindowInstance(Type T)
		{
			var windows = Application.Current.Windows;

			if (windows.Count != 0)
			{
				foreach (var window in windows)
				{
					if (window.GetType().Equals(T))
					{
						return (Window)window;
					}
				}
			}

			return null;
		}
		public static void HighlightButton(System.Windows.Controls.Primitives.ButtonBase button)
		{
			BrushConverter converter = new BrushConverter();
			Brush brush = (Brush)converter.ConvertFrom("#FFFAD7AC");
			brush.Freeze();
			button.Background = brush;
		}
		public static void ResetButtonColor(System.Windows.Controls.Primitives.ButtonBase button)
		{
			BrushConverter converter = new BrushConverter();
			Brush brush = (Brush)converter.ConvertFrom("#FFDAE8FC");
			brush.Freeze();
			button.Background = brush;
		}
		public static void FitDataGridToContent(DataGrid dg)
		{
			int t = 0;
			foreach (DataGridColumn column in dg.Columns)
			{
				//if you want to size your column as per the cell content
				//column.Width = new DataGridLength(1.0, DataGridLengthUnitType.SizeToCells);
				//if you want to size your column as per the column header
				//column.Width = new DataGridLength(1.0, DataGridLengthUnitType.SizeToHeader);
				//if you want to size your column as per both header and cell content
				//column.Width = new DataGridLength(1.0, DataGridLengthUnitType.Auto);
			}
		}
	}
}
