#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72038 "Project Funding Request Vouche"
{
    DrillDownPageID = "Project Funding Voucher";
    LookupPageID = "Project Funding Voucher";

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            var
                FYCodes: Record "Financial Year Code";
            begin
                if FYCodes.Get("Year Code") then begin
                  "Start Date":=FYCodes."Starting Date";
                  "End Date":=FYCodes."Ending Date";
                  end;
            end;
        }
        field(4;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Status;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Open;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(7;Region;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(8;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate));
        }
        field(9;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(10;"Responsibility Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(11;"Default Works Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where ("Procurement Type"=filter('WORKS'));
        }
        field(12;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Creation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Creation Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Default Funding Source";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(16;"Funding Total Value(LCY)";Decimal)
        {
            CalcFormula = sum("Project Funding Voucher Line"."Total Estimated Cost(LCY)" where ("Document No"=field("Document No")));
            FieldClass = FlowField;
        }
        field(17;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;Type;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Original;
            OptionCaption = ' ,Original,Revision';
            OptionMembers = " ",Original,Revision;
        }
        field(19;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(20;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,PFV,PFW';
            OptionMembers = " ",PFV,PFW;
        }
        field(21;"PFV No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Funding Request Vouche"."Document No" where ("Document Type"=filter(PFV));

            trigger OnValidate()
            begin
                LineNo:=0;

                PFVLine.Reset;
                PFVLine.SetRange(PFVLine."Document No","PFV No");
                if PFVLine.Find('-') then
                  repeat
                    LineNo:=LineNo+100;
                    PFVLine.TransferFields(PFVLine);
                    PFVLine."Document No":="Document No";
                    PFVLine."Line No":=LineNo;
                    PFVLine.Insert(true);
                   until PFVLine.Next= 0;
            end;
        }
        field(22;"Project No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Contigencies(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;Remarks;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Rejection Comment";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Constituency Code";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
        key(Key2;"Project No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::PFV then begin
        if "Document No" = '' then begin
          RMSetup.Get;
          RMSetup.TestField("Project Funding Voucher Nos");
          SeriesMgt.InitSeries(RMSetup."Project Funding Voucher Nos",xRec."No. Series",0D,"Document No","No. Series");
          end;
          end;

        if "Document Type" = "document type"::PFW then begin
        if "Document No" = '' then begin
          RMSetup.Get;
          RMSetup.TestField("Project Funding WorkSheet  Nos");
          SeriesMgt.InitSeries(RMSetup."Project Funding WorkSheet  Nos",xRec."No. Series",0D,"Document No","No. Series");
          end;
          end;

        "Created By":=UpperCase(UserId);
        "Creation Date":=Today;
        "Creation Time":=Time;


        ///////

        if UserSetup.Get(UserId) then begin
        if Employee.Get(UserSetup."Employee No.") then begin
        Region:=Employee."Global Dimension 1 Code";
        "Constituency Code":=Employee."Global Dimension 2 Code";
        Directorate:=Employee."Directorate Code";
        Department:=Employee."Department Code";
        //Division:=Employee.Division;
        end;
        end;

        //Fred RC
        if UserSetup.Get(UserId) then begin
          "Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
          end;
    end;

    var
        RMSetup: Record "Roads Management Setup";
        SeriesMgt: Codeunit NoSeriesManagement;
        PFVoucher: Record "Project Funding Request Vouche";
        PFVLine: Record "Project Funding Voucher Line";
        LineNo: Integer;
        ObjPFVLine: Record "Project Funding Voucher Line";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        Emp: Integer;
}

