#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72373 "Project Template Header"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";

            trigger OnValidate()
            begin
                Description:=Format("Project Type")+' - '+'Project Approval Template';
            end;
        }
        field(4;"Assignment Area ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Duty Station"),
                                                                Blocked=filter(false));
        }
        field(5;"Assignment Area Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(7;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"DateTime Last Modified";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Modified By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Table ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By":=UserId;
        "Created DateTime":=CurrentDatetime;
        "Effective Date":=Today;
        "Table ID":=72373;

        if "Template ID" ='' then begin
          RMSetup.Get();
          RMSetup.TestField("Project Approval Template Nos");
          NSMgt.InitSeries(RMSetup."Project Approval Template Nos",xRec."No. Series",Today,"Template ID","No. Series");
          end;
    end;

    trigger OnModify()
    begin
        "Modified By":=UserId;
        "DateTime Last Modified":=CurrentDatetime;
    end;

    var
        RMSetup: Record "Road Management Setup";
        NSMgt: Codeunit NoSeriesManagement;
        ResCenter: Record "Responsibility Center";
}

