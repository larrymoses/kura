#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72245 "DWR Incident Impact"
{
    DrillDownPageID = "DWR Incident Impacts";
    LookupPageID = "DWR Incident Impacts";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Incident Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Impact Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Injury,Fatality (Death),Financial Loss,Schedule Delay/Service Disruption(Days)';
            OptionMembers = " ",Injury,"Fatality (Death)","Financial Loss","Schedule Delay/Service Disruption(Days)";

            trigger OnValidate()
            begin
                 RiskManagementFramework.Get();
                 case "Impact Type" of
                  "impact type"::"Fatality (Death)":
                    begin
                     "Unit of Measure":=RiskManagementFramework."Default UoM (Fatalities)";
                    end;
                  "impact type"::"Financial Loss":
                    begin
                     "Unit of Measure":=RiskManagementFramework."Default UoM (Financial Loss)";
                    end;
                  "impact type"::Injury:
                    begin
                     "Unit of Measure":=RiskManagementFramework."Default UoM (Persons Injured)";
                    end;
                  "impact type"::"Schedule Delay/Service Disruption(Days)":
                    begin
                     "Unit of Measure":=RiskManagementFramework."Default UoM Duration of Delays";
                    end;
                  end;
            end;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(7;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Category of Party Affected";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(9;"Internal Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Category of Party Affected"=filter("Internal Employee")) Resource."No." where (Type=filter(Person),
                                                                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.","Internal Employee No.");
                if Resource.FindSet then begin
                  Name:=Resource.Name;
                end;
            end;
        }
        field(10;Name;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Contact Details";Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Additional Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Incident Line No.","Impact Line No.","Impact Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        RiskManagementFramework: Record "Risk Management Framework";
}

