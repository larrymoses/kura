#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69233 "HR Job Applications"
{
    Caption = 'HR Job Applications';

    fields
    {
        field(1;"Application No";Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Application No" <> xRec."Application No" then begin
                  HRSetup.Get;
                  NoSeriesMgt.TestManual(HRSetup."Job Application Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"First Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
            end;
        }
        field(5;Initials;Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Search Name";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Postal Address";Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Residential Address";Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(10;City;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Post Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12;County;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Home Phone Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Cell Phone Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Work Phone Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Ext.";Text[7])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"E-Mail";Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(19;Picture;Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
        field(20;"ID Number";Text[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                HRJobApp.Reset;
                HRJobApp.SetRange(HRJobApp."ID Number","ID Number");
                if HRJobApp.Find('-') then begin
                  Error('This ID Number has been used in a prior Job Application.');
                end;
            end;
        }
        field(21;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Female,Male,Both;
        }
        field(22;"Country Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(23;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Normal,Resigned,Discharged,Retrenched,Pension,Disabled;
        }
        field(24;Comment;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25;"Fax Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Marital Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(27;"Ethnic Origin";Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ethnic Background"."Ethnic group";
        }
        field(28;"First Language (R/W/S)";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Lookup Values".Code where (Type=filter(Language));
        }
        field(29;"Driving Licence";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(30;Disabled;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = No,Yes," ";
        }
        field(31;"Health Assesment?";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Health Assesment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Date Of Birth";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Date Of Birth" >=Today then begin
                    Error('Date of Birth cannot be after %1',Today);
                end;
            end;
        }
        field(34;Age;Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Second Language (R/W/S)";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Lookup Values".Code where (Type=filter(Language));
        }
        field(36;"Additional Language";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Lookup Values".Code where (Type=filter(Language));
        }
        field(37;"Primary Skills Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(38;Level;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(39;"Termination Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(40;"Postal Address2";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Postal Address3";Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(42;"Residential Address2";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Residential Address3";Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Post Code2";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(45;Citizenship;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;

            trigger OnValidate()
            begin
                Country.Reset;
                Country.SetRange(Country.Code,Citizenship);
                if Country.Find('-') then
                begin
                    "Citizenship Details":=Country.Name;
                end;
            end;
        }
        field(46;"Disability Details";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Disability Grade";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(48;"Passport Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(49;"2nd Skills Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(50;"3rd Skills Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(51;Region;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));
        }
        field(52;"First Language Read";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(53;"First Language Write";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(54;"First Language Speak";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(55;"Second Language Read";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(56;"Second Language Write";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57;"Second Language Speak";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(58;"PIN Number";Code[20])
        {
            Caption = 'KRA PIN Number';
            DataClassification = ToBeClassified;
        }
        field(59;"Job Applied For";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60;"Employee Requisition No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Requisitions"."Requisition No.";

            trigger OnValidate()
            begin

                HREmpReq.Reset;
                HREmpReq.SetRange(HREmpReq."Requisition No.","Employee Requisition No");
                if HREmpReq.Find('-') then
                "Job Applied For":=HREmpReq."Job ID";
                "Job Applied for Description":=HREmpReq."Job Title";
            end;
        }
        field(61;"Total Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(62;Shortlist;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(63;Qualified;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(64;Stage;Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(65;"No. Series";Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(66;"Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                //COPY EMPLOYEE DETAILS FROM EMPLOYEE TABLE
                Employee.Reset;
                if Employee.Get("Employee No") then begin
                "First Name":=Employee."First Name";
                "Middle Name":=Employee."Middle Name";
                "Last Name":=Employee."Last Name";
                "Search Name":=Employee."Search Name";
                "Postal Address":=Employee."Postal Address";
                "Residential Address":=Employee."Residential Address";
                City:=Employee.City;
                "Post Code":=Employee."Post Code";
                County:=Employee.County;
                "Home Phone Number":=Employee."Home Phone Number";
                //"Cell Phone Number":=Employee."Cell Phone Number";
                "Work Phone Number":=Employee."Work Phone Number";
                "Ext.":=Employee."Ext.";
                "E-Mail":=Employee."E-Mail";
                "ID Number":=Employee."ID Number";
                Gender:=Employee.Gender;
                "Country Code":=Employee.Citizenship;
                "Fax Number":=Employee."Fax Number";
                "Marital Status":=Employee."Marital Status";
                "Ethnic Origin":=Employee."Ethnic Origin";
                "First Language (R/W/S)":=Employee."First Language (R/W/S)";
                //"Driving Licence":=Employee."Has Driving Licence";
                //Disabled:=Employee.Disabled;
                //"Health Assesment?":=Employee."Health Assesment?";
                //"Health Assesment Date":=Employee."Health Assesment Date";
                "Date Of Birth":=Employee."Date Of Birth";
                Age:=Employee.Age;
                "Second Language (R/W/S)":=Employee."Second Language (R/W/S)";
                "Additional Language":=Employee."Additional Language";
                Citizenship:=Employee.Citizenship;
                "Passport Number":=Employee."Passport Number";
                //"First Language Read":=Employee."First Language Read";
                //"First Language Write":=Employee."First Language Write";
                //"First Language Speak":=Employee."First Language Speak";
                //"Second Language Read":=Employee."Second Language Read";
                //"Second Language Write":=Employee."Second Language Write";
                //"Second Language Speak":=Employee."Second Language Speak";
                //"PIN Number":=Employee."PIN No.";
                
                "Applicant Type":="applicant type"::Internal;
                Modify;
                /*
                            //DELETE QUALIFICATIONS PREVIOUSLY COPIED
                            AppQualifications.RESET;
                            AppQualifications.SETRANGE(AppQualifications."Application No","Application No");
                            IF AppQualifications.FIND('-') THEN
                            AppQualifications.DELETEALL;
                
                            //GET EMPL0YEE QUALIFICATIONS
                            EmpQualifications.RESET;
                            EmpQualifications.SETRANGE(EmpQualifications."Employee No.",Employee."No.");
                            IF EmpQualifications.FIND('-') THEN
                            EmpQualifications.FINDFIRST;
                            BEGIN
                            AppQualifications.RESET;
                
                                REPEAT
                                AppQualifications.INIT;
                                AppQualifications."Application No":="Application No";
                                AppQualifications."Employee No.":="Employee No";
                                AppQualifications."Qualification Type":=EmpQualifications."Qualification Type";
                                AppQualifications."Qualification Code":=EmpQualifications."Qualification Code";
                                AppQualifications."Qualification Description":=EmpQualifications."Qualification Description";
                                AppQualifications."From Date":=EmpQualifications."From Date";
                                AppQualifications."To Date":=EmpQualifications."To Date";
                                AppQualifications.Type:=EmpQualifications.Type;
                                AppQualifications."Institution/Company":=EmpQualifications."Institution/Company";
                                AppQualifications.INSERT();
                
                                UNTIL EmpQualifications.NEXT = 0;
                            END*/
                end;
                
                /*
                END ELSE BEGIN
                "First Name":='';
                "Middle Name":='';
                "Last Name":='';
                "Search Name":='';
                "Postal Address":='';
                "Residential Address":='';
                City:=Employee.City;
                "Post Code":='';
                County:='';
                "Home Phone Number":='';
                "Cell Phone Number":='';
                "Work Phone Number":='';
                "Ext.":='';
                "E-Mail":='';
                "ID Number":='';
                
                "Country Code":='';
                "Fax Number":='';
                
                "First Language (R/W/S)":='';
                //"Driving Licence":=Employee."Has Driving Licence";
                
                "Health Assesment Date":=0D;
                "Date Of Birth":=0D;
                Age:='';
                "Second Language (R/W/S)":='';
                "Additional Language":='';
                "Postal Address2":='';
                "Postal Address3":='';
                "Residential Address2":='';
                "Residential Address3":='';
                "Post Code2":='';
                Citizenship:='';
                "Passport Number":='';
                "First Language Read":=FALSE;
                "First Language Write":=FALSE;
                "First Language Speak":=FALSE;
                "Second Language Read":=FALSE;
                "Second Language Write":=FALSE;
                "Second Language Speak":=FALSE;
                "PIN Number":='';
                
                "Applicant Type":="Applicant Type"::External;
                MODIFY;
                
                //DELETE QUALIFICATIONS PREVIOUSLY COPIED
                AppQualifications.RESET;
                AppQualifications.SETRANGE(AppQualifications."Application No","Application No");
                IF AppQualifications.FIND('-') THEN
                AppQualifications.DELETEALL;
                
                //DELETE APPLICANT REFEREES
                AppRefferees.RESET;
                AppRefferees.SETRANGE(AppRefferees."Job Application No","Application No");
                IF AppRefferees.FIND('-') THEN
                AppRefferees.DELETEALL;
                
                //DELETE APPLICANT HOBBIES
                AppHobbies.RESET;
                AppHobbies.SETRANGE(AppHobbies."Job Application No","Application No");
                IF AppHobbies.FIND('-') THEN
                AppHobbies.DELETEALL;
                
                END;
                */

            end;
        }
        field(67;"Applicant Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal,AMPATH;
        }
        field(68;"Interview Invitation Sent";Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(69;"Date Applied";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70;"Citizenship Details";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(71;Expatriate;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(72;"Total Score After Interview";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(73;"Total Score After Shortlisting";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(74;"Date of Interview";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(75;"From Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(76;"To Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(77;Venue;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(78;"Job Applied for Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(79;"Regret Notice Sent";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80;"Interview Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Writen,Practicals,Oral';
            OptionMembers = Writen,Practicals,Oral;
        }
        field(81;"Current Duties";Text[300])
        {
            Caption = 'Current Duties,responsibilities and assignments';
            DataClassification = ToBeClassified;
        }
        field(82;"Abilites,Skills";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(83;NHIF;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(84;NSSF;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85;"Alternative Email";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(86;"Current Employer";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(87;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(88;"Position held";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(89;"Gross Salary";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(90;Convicted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(91;"Conviction Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(92;Dismissal;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(93;"Dismissal Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(94;"Disability Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(95;"Job Id";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(96;Religion;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(97;"Altenative Phone Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(98;"Highest Education Level";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(99;"Department Code";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(100;"Job Group";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(101;"First Appointment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(102;"Last Appointment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(103;Declaralation;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(104;"Expected Salary";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(105;"Town/City";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(106;"Details of Disability regist";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(109;"Application Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Submitted,"In-process",Shortlisted,Interview,Succesful;
        }
    }

    keys
    {
        key(Key1;"Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('You are not permitted to delete any entry in the applications table');
    end;

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if  "Application No" = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Job Application Nos");
          NoSeriesMgt.InitSeries(HRSetup."Job Application Nos",xRec."No. Series",0D,"Application No","No. Series");
        end;

        "Date Applied":=Today;
    end;

    var
        HREmpReq: Record "Employee Requisitions";
        Employee: Record Employee;
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpQualifications: Record "HR Employee Qualifications";
        AppRefferees: Record "HR Applicant Referees";
        HRJobApp: Record "HR Job Applications";
        Country: Record "Country/Region";


    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
          exit("First Name" + ' ' + "Last Name")
        else
          exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;
}

