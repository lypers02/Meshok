Label 
    m_1;
Var
  i,h:word;
  n,m:integer;
  s:String;
  f:Text;
  a:array of integer;
Begin  
      Assign(f,'log.txt');                              // Связь файловой переменной с именем внешнего файла 
      Append(f);                                        // Открытие внешнего файла
      writeln(f,String.Format('{0:d/M/yyyy HH:mm:ss}', DateTime.Now));                         
      m_1: Write('Введите число N (N>1) = ');     
      ReadLn(s);
      Val(s,n,m);  
      if m<>0  then  begin writeln ('Ошибка, повторите ввод!');writeln(f,'N = ',s,'  ','Oшибка, повторите ввод!'); goto m_1 end;             // Контроль ввода числа
      if (n=1) or (n<0) then begin writeln('Oшибка, повторите ввод!'); writeln(f,'N = ',s,'  ','Oшибка, повторите ввод!'); goto m_1; end;    // Контроль заданного интервала
      Setlength(a,n+1);                                // Изменение размера динамического массива
      for i:=1 to n do a[i]:= i;                       // Заполнение массива числами от 1 до N
      Randomize;
      for i := n downto 2 do                           // Перемешивание элементов массива
      begin
         m := Random(i-1) + 1;                         // Выбор случайного элемента
         h := a[i];                                    // Замена элементов
         a[i] := a[m];
         a[m] := h;
      end;
      writeln ('В мешке ',n, ' бочонков');
      writeln (f, 'N = ',n);
      writeln (f, 'В мешке ',n, ' бочонков');
      write ('Для проведения жеребьёвки нажмите любую клавишу');
      readln;
      for i:=1 to n do                     
      begin
        write (a[i], ' ');                              //Вывод перемешанного массива на экран
        write (f, a[i], ' ');                           //Вывод перемешанного массива в файл
      end;
      writeln;
      writeln ('Жеребьёвка произведена');
      writeln (f, '    Жеребьёвка произведена');
      Close(f);                                        //Закрытие внешнего файла
End.