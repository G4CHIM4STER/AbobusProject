   M S B A M L   `   `   `  ����A  =Brylev, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Brylev.ClientsBrylev.Clients  5   	       Brylev.Clients.AllClients   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Brylev.Clients     5   	     � Title$  
AllClients��5   	   .��5	      �  � ColumnDefinitions 5
      �� 5      $
��270* �6   �� 5      $��0* �6   �� 5      $	��80* �6   �� 5      $	��80* �6   �� 5      $��0* �6    � RowDefinitions 5      �� 5      $	��60* �6   �� 5      $
��375* �6   .+�5      �� -   5         ��Name$ AlterButton��5      $��Изменить��6    ���	#FFFAD7AC$��2��6J   $��20(�6Z   $
��Bold"�6h   
�������6z   �� 5      -   5        $ InsertButton��5      $��Добавить��6!   ���	#FFFAD7AC$��3��6K   $��20(�6[   $
��Bold"�6i   
�������6{   � 5      $��0��6	   
�������.+�5      �� $#��Список клиентов��6   $��20(�6$   $
��Bold"�62   $��Center=�6D   $��Center=�6a   
�������6|   5      &   System.Windows.Controls.DataGrid  5      -   5          Name$ RequestsDataGrid��5      
�������$��1��6;   $��5��6H   5      5      