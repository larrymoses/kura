#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69029 "HR Applicant Accounts"
{

    fields
    {
        field(1;ID;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;FirstName;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;LastName;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Password;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Salt;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Initials;Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Postal Address";Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(12;City;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Post Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(14;County;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Cell Phone Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Female,Male,Both;
        }
        field(17;"Country Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(18;"Marital Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(19;"Ethnic Origin";Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ethnic Background"."Ethnic group";
        }
        field(20;Disabled;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = No,Yes," ";
        }
        field(21;"Date Of Birth";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*IF "Date Of Birth" >=TODAY THEN BEGIN
                    ERROR('Date of Birth cannot be after %1',TODAY);
                END;*/

            end;
        }
        field(22;Citizenship;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;

            trigger OnValidate()
            begin
                /*Country.RESET;
                Country.SETRANGE(Country.Code,Citizenship);
                IF Country.FIND('-') THEN
                BEGIN
                    "Citizenship Details":=Country.Name;
                END;*/

            end;
        }
        field(23;"Disability Details";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Disability Grade";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;Region;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));
        }
        field(26;"PIN Number";Code[20])
        {
            Caption = 'KRA PIN Number';
            DataClassification = ToBeClassified;
        }
        field(27;"Job Applied For";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28;"Date Applied";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Citizenship Details";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Current Duties";Text[300])
        {
            Caption = 'Current Duties,responsibilities and assignments';
            DataClassification = ToBeClassified;
        }
        field(32;"Abilites,Skills";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(33;NHIF;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;NSSF;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Alternative Email";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Current Employer";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Position held";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Gross Salary";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40;Convicted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Conviction Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(42;Dismissal;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Dismissal Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Disability Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(45;Religion;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Altenative Phone Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Highest Education Level";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48;"Expected Salary";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49;"Details of Disability regist";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50;"Work In All Centers";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(51;"ID Number";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

