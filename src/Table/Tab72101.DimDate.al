#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72101 "DimDate"
{

    fields
    {
        field(1;DateKey;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;FullDateAlternateKey;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;DayNumberOfWeek;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;EnglishDayNameOfWeek;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;SpanishDayNameOfWeek;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;FrenchDayNameOfWeek;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;DayNumberOfMonth;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;DayNumberOfYear;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;WeekNumberOfYear;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;EnglishMonthName;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;SpanishMonthName;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;FrenchMonthName;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;MonthNumberOfYear;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;CalendarQuarter;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;CalendarYear;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16;CalendarSemester;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;FiscalQuarter;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;FiscalYear;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;FiscalSemester;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;DateKey)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

