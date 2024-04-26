﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Бюджетирование'
		
Сценарий: Я нахожу в списке вид отчета с именем 'TheReportKindDescription'

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды и бланки отчетов"
	Тогда открылось окно "Виды и бланки отчетов"
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
	И я меняю значение переключателя с именем 'CompareType' на "По части строки"
	И в поле с именем 'Pattern' я ввожу текст '[TheReportKindDescription]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда в таблице 'СписокВидовОтчетов' количество строк 'равно' 1

Сценарий: Открылся экземпляр отчета для вида отчета "TheReportKind" валюта "TheCurrency" организация "TheBusinessUnit" сценарий 'TheScenario' периодичность 'TheFrequency' проект 'TheProject' аналитики 'TheDimension1' 'TheDimension2' 'TheDimension3' 'TheDimension4' 'TheDimension5' 'TheDimension6' 

	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		И я запоминаю строку 'Экземпляр отчета \"[TheReportKind]\": <[TheCurrency]> <[TheBusinessUnit]> <* - * (Периодичность: [TheFrequency]) <[TheScenario]>>' в переменную 'ЗаголовокОкна'
	ИначеЕсли '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		И я запоминаю строку 'The \"[TheReportKind]\" report instance: <[TheCurrency]> <[TheBusinessUnit]> <* - * (Frequency: [TheFrequency]) <[TheScenario]>>' в переменную 'ЗаголовокОкна'			

	Если 'НЕ ПустаяСтрока("[TheProject]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheProject]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[TheDimension1]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheDimension1]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[TheDimension2]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheDimension2]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[TheDimension3]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheDimension3]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[TheDimension4]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheDimension4]>' в переменную 'ЗаголовокОкна'	
	Если 'НЕ ПустаяСтрока("[TheDimension5]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheDimension5]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[TheDimension6]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[TheDimension6]>' в переменную 'ЗаголовокОкна'

	И я запоминаю строку '$ЗаголовокОкна$*' в переменную 'ЗаголовокОкна'
	И я жду открытия окна '$ЗаголовокОкна$' в течение 30 секунд

Сценарий: Открылся документ управления периодом для сценария 'TheScenario' периодичность 'TheFrequency' 

	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		И я запоминаю строку '* - * (Периодичность: [TheFrequency]) <[TheScenario]>' в переменную 'ЗаголовокОкна'
	ИначеЕсли '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		И я запоминаю строку '* - * (Frequency: [TheFrequency]) <[TheScenario]>' в переменную 'ЗаголовокОкна'

	И открылось окно '$ЗаголовокОкна$'

Сценарий: Открылся регламент подготовки отчетности 'TheDescription' 

	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		Если 'ПустаяСтрока("[TheDescription]")' Тогда
			И я запоминаю строку 'Регламент от * (Создание)*' в переменную 'ЗаголовокОкна'
		Иначе
			И я запоминаю строку '[TheDescription] от * (Регламент подготовки отчетности)*' в переменную 'ЗаголовокОкна'
	ИначеЕсли '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		Если 'ПустаяСтрока("[TheDescription]")' Тогда
			И я запоминаю строку 'Regulation from * (Create)*' в переменную 'ЗаголовокОкна'
		Иначе
			И я запоминаю строку '[TheDescription] from * (Regulation for preparing reports)*' в переменную 'ЗаголовокОкна'

	И открылось окно '$ЗаголовокОкна$'	

Сценарий: Открылся бланк для вида отчета 'TheReportKind'

	И я запоминаю строку "Бланк [TheReportKind] вида отчета: [TheReportKind]*" в переменную 'ЗаголовокОкна'
	И открылось окно '$ЗаголовокОкна$'

Сценарий: Открылся бланк сводной таблицы для вида отчета 'TheReportKind'

	И я запоминаю строку "Бланк сводной таблицы: [TheReportKind] (сводная таблица)*" в переменную 'ЗаголовокОкна'
	И открылось окно '$ЗаголовокОкна$'

Сценарий: Открылась сводная таблица для вида отчета 'TheReportKind'

	И я запоминаю строку "Сводная таблица: [TheReportKind] (сводная таблица)*" в переменную 'ЗаголовокОкна'
	И я жду открытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: Открылась сводная таблица для варианта 'TheVariant'

	И я жду открытия окна "Сводная таблица: [TheVariant]*" в течение 20 секунд

Сценарий: Открылась правило расчета для вида отчета 'TheReportKind'

	И открылось окно "[TheReportKind] (Правила расчета)*"
	
Сценарий: Я подставляю в строку 'TheLine' параметры 'TheParameter1' 'TheParameter2' 'TheParameter3'

	И Я запоминаю значение выражения 'СтрШаблон("[TheLine]", "[TheParameter1]", "[TheParameter2]", "[TheParameter3]")' в переменную 'ИтоговаяСтрока'

Сценарий: Я выбираю показатель с кодом 'TheIndicatorCode'

	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		Тогда открылось окно "Показатели отчетов"
		И я меняю значение переключателя с именем 'РежимВыбораПоказателя' на "Макет структуры"
		И в табличном документе 'ТабДокВыборПоказателя' я перехожу к ячейке '[TheIndicatorCode]'
		И в табличном документе 'ТабДокВыборПоказателя' я делаю двойной клик на текущей ячейке
	Иначе
		Тогда открылось окно "Показатели отчетов"
		И я меняю значение переключателя с именем 'РежимВыбораПоказателя' на "Список показателей"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И в поле с именем 'Pattern' я ввожу текст '[TheIndicatorCode]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Показатели отчетов"
		И в таблице 'Список' я выбираю текущую строку

Сценарий: Я выбираю организацию 'TheName'

	Если '$$ЭтоPerform$$' Тогда
		И Я в списке "Организационные единицы" по полю "Наименование" ищу и выбираю элемент '[TheName]' "По началу строки"
	ИначеЕсли '$$ЭтоУХ$$' Тогда
		И Я в списке "Организационные единицы" по полю "Наименование в программе" ищу и выбираю элемент '[TheName]' "По точному совпадению"
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И Я в списке "Организации" по полю "Рабочее наименование" ищу и выбираю элемент '[TheName]' "По точному совпадению"