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
		//Буфер сохранения последней нажатой кнопки для цветного выделения
		Button LastPressedButton;

		public delegate void OpenWindowHandler(object sender, RoutedEventArgs e, Type T);
		public event OpenWindowHandler OpenWindow;

		public AfterAuthorization()
		{
			InitializeComponent();
			OpenWindow += AfterAuthorization_OpenWindow;
			App.afterAuthorization = this;
		}

		/// <summary>
		/// Обработчик нажатий на кнопки главной формы
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void ButtonClick(object sender, RoutedEventArgs e)
		{
			AfterAuthorization_OpenWindow(sender, e, null);
		}

		/// <summary>
		/// Закрытие приложения
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void Exit(object sender, RoutedEventArgs e)
		{
			System.Windows.Application.Current.Shutdown();
		}

		/// <summary>
		/// Обработчик открытия модальных окон внутри главного окна
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		/// <param name="T">Тип класса окна</param>
		private void AfterAuthorization_OpenWindow(object sender, RoutedEventArgs e, Type T)
		{
			ResetChildWindows();

			if (T == null)
			{
				ChangeButtonColorStates(sender);

				if (sender.Equals(this.ClientsButton))
				{
					OpenNewChildWindow(typeof(Clients.AllClients));
				}
				else if (sender.Equals(this.ContractsButton))
				{
					OpenNewChildWindow(typeof(Contracts.AllDocs));
				}
				else if (sender.Equals(this.EmployeesButton))
				{
					OpenNewChildWindow(typeof(Employees.AllEmployees));
				}
				else if (sender.Equals(this.EquipmentButton))
				{
					OpenNewChildWindow(typeof(Equipment.AllEquipment));
				}
				else if (sender.Equals(this.ReportsButton))
				{
					//OpenNewChildWindow(typeof(Docs.AllDocs));
				}
				else if (sender.Equals(this.RequestsButton))
				{
					OpenNewChildWindow(typeof(Applications.AllApplications));
				}
				else if (sender.Equals(this.ServicesButton))
				{
					OpenNewChildWindow(typeof(Services.AllServices));
				}
			}
			else
			{
				OpenNewChildWindow(T);
			}
		}

		/// <summary>
		/// Метод открытия нового окна внутри главной формы
		/// </summary>
		/// <param name="windowType">Тип окна</param>
		private void OpenNewChildWindow(Type windowType)
		{
			Window window = (Window)Activator.CreateInstance(windowType);
			object requestContent = window.Content;
			window.Content = null;

			this.ChildWindow.Children.Add(requestContent as UIElement);
		}

		/// <summary>
		/// Метод очищения внутренних окон
		/// </summary>
		private void ResetChildWindows()
		{
			this.ChildWindow.Children.Clear();
		}

		/// <summary>
		/// Обработчик открытия конкретного окна для реализации внешними объектами
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		/// <param name="T">Тип окна</param>
		public void OpenNewWindow(object sender, RoutedEventArgs e, Type T)
		{
			AfterAuthorization_OpenWindow(sender, e, T);
		}

		/// <summary>
		/// Изменение цвета кнопок
		/// </summary>
		/// <param name="button">Последняя нажатая кнопка</param>
		private void ChangeButtonColorStates(object button)
		{
			if (LastPressedButton != null)
			{
				Utilities.Utils.ResetButtonColor(LastPressedButton);
			}

			Button _button = button as Button;
			Utilities.Utils.HighlightButton(_button);
			LastPressedButton = _button;
		}


	}
}
