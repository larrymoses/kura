#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95116 "RMP Line Risk Ownership"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Responsibility Center ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Responsibility Center ID");
                if  ResponsibilityCenter.FindSet then
                Name:=ResponsibilityCenter.Name;
            end;
        }
        field(5;Name;Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Responsible Officer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const("Internal Team")) "Internal Project Resource"."Resource No." where ("Project ID"=field("Project ID"))
                            else if (Type=const("Contractor Team")) "WEP Contractor Team"."Contractor Staff No." where ("Project ID"=field("Project ID"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.","Responsible Officer No.");
                if WEPContractorTeam.FindSet then
                  Name:=WEPContractorTeam.Name;

                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.","Responsible Officer No.");
                if InternalProjectResource.FindSet then
                  Name:=InternalProjectResource.Name;
            end;
        }
        field(7;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Team,Contractor Team';
            OptionMembers = " ","Internal Team","Contractor Team";
        }
        field(9;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange(RiskManagementPlan."Document No","Document No");
        RiskManagementPlan.SetRange(RiskManagementPlan."Document Type","Document Type");
        if RiskManagementPlan.FindSet then
          "Project ID":=RiskManagementPlan."Project ID";
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        RiskManagementPlan: Record "Risk Management Plan";
        WEPContractorTeam: Record "WEP Contractor Team";
        InternalProjectResource: Record "Internal Project Resource";
}

