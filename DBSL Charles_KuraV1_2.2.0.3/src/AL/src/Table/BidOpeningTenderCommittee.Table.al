#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70177 "Bid Opening Tender Committee"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            
            TableRelation = "Bid Opening Register".Code;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            
        }
        field(3;"Appointed Bid Opening Com";Code[30])
        {
            Caption = 'Appointed Bid Opening Committee';
            
            Description = 'Appointed Bid Opening Committee';
        }
        field(4;"Role Type";Option)
        {
            
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(5;"Member No.";Code[30])
        {
            
            Description = 'Linked to Resource Table (This shall support definition of both staff and non-staff (e.g. Experts and Consultants) who form the committee';
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Resources.Get;
                Resources.SetRange("No.","Member No.");
                if Resources.FindSet then begin
                  "Member Name":=Resources.Name;
                  Emp.Reset;
                  Emp.SetRange("No.","Member No.");
                  if Emp.FindSet then begin
                    "Staff  No.":=Emp."No.";
                    end;

                  end;
            end;
        }
        field(6;"Member Name";Text[60])
        {
            
            Editable = false;
        }
        field(7;Designation;Text[60])
        {
            
            Editable = false;
        }
        field(8;"ID/Passport No";Code[30])
        {
            
        }
        field(9;"Tax Registration (PIN) No.";Code[30])
        {
            
        }
        field(10;Email;Text[80])
        {
            
        }
        field(11;"Telephone No.";Text[50])
        {
            
        }
        field(12;"Staff  No.";Code[20])
        {
            
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Reset;
                  Emp.SetRange("No.","Staff  No.");
                  if Emp.FindSet then begin
                    Emp.CalcFields("Job Title");
                    Designation:=Emp."Job Title";
                    "ID/Passport No":=Emp."ID Number";
                    "Tax Registration (PIN) No.":=Emp."P.I.N";
                    end;
            end;
        }
        field(13;"IFS Code";Code[20])
        {
            
            TableRelation = "Standard Purchase Code".Code;
        }
        field(30;"Opening Person 1";Code[60])
        {
            
            ExtendedDatatype = Masked;
        }
        field(31;"Opening Person 2";Code[60])
        {
            
            ExtendedDatatype = Masked;
        }
        field(32;"Opening Person 3";Code[60])
        {
            
            ExtendedDatatype = Masked;
        }
        field(33;"Nominated Bid Opening";Option)
        {
            
            OptionCaption = ' ,Member 1,Member 2 ,Member 3,Member 4,Member 5';
            OptionMembers = " ","Member 1","Member 2 ","Member 3","Member 4","Member 5";
        }
        field(34;"Opening Person 5";Code[60])
        {
            
            ExtendedDatatype = Masked;
        }
        field(35;"Opening Person 4";Code[60])
        {
            
            ExtendedDatatype = Masked;
        }
        field(36;Type;Option)
        {
            
            OptionCaption = 'Bid Opening';
            OptionMembers = "Bid Opening";
        }
        field(37; "Code Sent"; Boolean)
        {
            
        }
        field(38; "Sent Datetime"; DateTime)
        {
            
        }
        field(39; "Opening Code"; Code[60])
        {
           ExtendedDatatype = Masked;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Resources: Record Resource;
        Emp: Record Employee;
}

