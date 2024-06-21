#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72366 "Survey Request Header"
{
    DrillDownPageID = "Survey/Study/Design Requests";
    LookupPageID = "Survey/Study/Design Requests";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate),
                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Directorate ID");
                if ResponsibilityCenter.FindSet then begin
                  "Directorate Name":=ResponsibilityCenter.Name;
                  Description:='Request for Survey/Study/Design'+'-'+"Directorate Name";
                  end;
            end;
        }
        field(4;"Directorate Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"),
                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Department ID");
                if ResponsibilityCenter.FindSet then begin
                  "Department Name":=ResponsibilityCenter.Name;
                   end;
            end;
        }
        field(7;"Department Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(9;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Requestor No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Requestor Name";Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Requestor Region";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;Submitted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Submitted By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Submmitted Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Submitted Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Project ID";Code[50])
        {
            CalcFormula = lookup("Survey Request Line"."Project ID" where ("Document No."=field("Document No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Document No.",Description,"Project ID","Requestor Name")
        {
        }
        fieldgroup(Brick;"Document No.",Description,"Requestor Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Document No."='' then begin
          RoadManagementSetup.Get();
          RoadManagementSetup.TestField("Survey Request Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Survey Request Nos",xRec."No. Series",Today,"Document No.","No. Series");
          end;

        Status:=Status::Open;
        "Document Date":=Today;
        "Created By":=UserId;
        "Created Date":=Today;
        "Created Time":=Time;
        UserSetup.Get(UserId);

         if UserSetup."Portal User" = false then begin

         UserSetup.Reset;
         UserSetup.SetRange(UserSetup."User ID",UpperCase(UserId));
         if UserSetup.Find('-') then
         begin
          Employee.Reset;
          Employee.SetRange(Employee."No.",UserSetup."Employee No.");
          if Employee.Find('-')then
          begin
            "Requestor No":=Employee."No.";
            "Requestor Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            "Requestor Region":=Employee."Global Dimension 1 Code";
            "Directorate ID":=Employee."Directorate Code";
            Validate("Directorate ID");
            "Department ID":=Employee."Department Code";
            Validate("Department ID");
          end;
         end;
         end;
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Employee: Record Employee;
}

