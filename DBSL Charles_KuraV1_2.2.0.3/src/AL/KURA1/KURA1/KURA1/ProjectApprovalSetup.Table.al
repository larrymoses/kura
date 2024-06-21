#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72375 "Project Approval Setup"
{

    fields
    {
        field(1;"Project ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Project Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(3;"Table ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Project Role Code";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where (Blocked=filter(false));
        }
        field(5;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Assignment Area ID";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Duty Station"));
        }
        field(7;"Sequence No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Region ID";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region),
                                                                "Assignment Area ID"=field("Assignment Area ID"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Region ID");
                if ResponsibilityCenter.FindSet then begin
                  "Region Name":=ResponsibilityCenter.Name;
                  end;
            end;
        }
        field(9;"Region Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Commenncement Order,Communication Plan,Staff Appointments,Internal Staff Disengement,Staff Disengagement,Mobilization Checklist,Mobilization Checklist Status Report,Professional Indemnity,Work Execution Plan,HSE Plan,RMP,QMP,Contract Supervision Requirement,Site Agent Nomination,Contractor Key Personnel Appointment,Equipment Delivery To Site,Insurance of Works,Advance Payment Guarantee,Performance Guarantee,Equipment Tracking';
            OptionMembers = " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";
        }
    }

    keys
    {
        key(Key1;"Project ID","Project Type","Assignment Area ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

