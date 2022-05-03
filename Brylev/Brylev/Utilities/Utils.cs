using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media;

namespace Brylev.Utilities
{
	internal class Utils
	{
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
	}
}
