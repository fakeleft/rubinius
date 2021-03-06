---
layout: doc_ru
title: Стиль программирования
previous: Общение
previous_url: contributing/communication
next: Ruby
next_url: ruby
---

Следующие правила позволяют поддерживать код Rubinius в порядке. Если у Вас
возникают вопросы по стилю, задайте их на IRC канале #rubinius на сервере
irc.freenode.net.


## Любой код

  * Настройте Ваш редактор на использование мягкой табуляции
  * Заменяйте знаки табуляции двумя пробелами
  * В конце любого файла оставляйте пустую строку


## C++

  * Не вставляйте пробел между условием и скобкой.
      Пишите "`if(1)`", а не "`if (1)`"

  * Открывающую фигурную скобку помещайте на одну строчку с условием или
    объявлением функции.

  * Всегда используйте фигурные скобки, даже если их можно опустить.

  * Используйте скобки для явной приоритезации (в пределах разумного).

  * Альтернативные варианты функций должны именоваться таким образом, чтобы
    было понятно, чем они отличаются от основной. Допустим, есть функция
    `person()`, и Вы хотите сделать альтернативную функцию, которая принимает
    дополнительный параметр "имя". В таком случае имя функции должно быть
    `person_with_name(char \*name)` или `person_with_details(char \*name, ...)`,
    а ни в коем случае не `person1(char \*name)`.


## Ruby

  * Методы. Пытайтесь реализовывать Ваши методы кратко --- не более 1 экрана
    на метод. Придерживайтесь принципа DRY в разумных пределах. Обычно общую
    функциональность следует абстрагировать в методы-помощники (которые
    можно  сделать приватными), но в некоторых случаях, особенно во время
    работы с Core, слепое следование DRY может мешать, например когда
    необходимо маневрировать среди различных ошибочных состояний.

  * Имена методов должны быть ясными, выразительными и осмысленными. За
    некоторым исключением, старайтесь не использовать знаки подчеркивания для
    "защиты" методов (`__send__`).

  * Допускается именование методов в стиле Smalltalk. Имеется ввиду, что если
    у вас есть метод `SomeClass.make_from` и он вызывается как
    `SomeClass.make_from file` или `SomeClass.make_from :file => name`,
    имя параметра дополняет имя метода, что улучшает читаемость текста.

  * Имена переменных должны быть ясными и осмысленными (естественно, можно
    использовать имя 'i' для счетчика). Пытайтесь не перекрывать названия
    методов переменными, например внутри класса Array используйте 'idx'
    вместо 'index', поскольку последнее уже является именем метода.

  * Используйте модификаторы только в том случае, когда Ваше выражение
    помещается на одной строчке, а условий не очень много.

  * Блоки. Используйте либо `do ... end`, либо `{...}`, ставьте пробелы между
    разделителями и кодом (`foo { |arg| code }`). Разбивайте длинные и сложные
    выражения на несколько строк, примерно как в следующем случае:

        mapped = foo.map do |elem|
          do_something_with elem
        end

  * Определение Module/Class с указанием пространства имен должно выглядеть
    так:

        module Rubinius::Profiler
          class Sampler
          end
        end

## Код ядра

Первичное требование для всего кода ядра --- простота и эффективность. Простой
код зачастую наиболее эффективен и понятен. В коде, отвечающем за
начальную загрузку, не должно быть метапрограммирования. Используйте #attr_xxx
методы внутри любых исходников ядра. Также, для задания алиасов методам
используйте #alias_method, вызываемый сразу за описанием метода. Делайте методы
приватным с помощью `private :sym` сразу после описания метода. Помните,
что версии методов, описанных выше на стадии alpha, принимают один символьный
аргумент.

## Документация

  * Используйте RDoc для документирования в Ruby коде.

  * Используйте Doxygen для документирования в C++ коде.

  * Используйте Markdown для документирования в директории `/doc`. См.
    [<<Синтаксис Markdown>>](http://daringfireball.net/projects/markdown/syntax).
    Установите ширину текста в 78 символов и используйте жесткие переводы
    строки.
