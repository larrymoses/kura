#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72171 "Project Meeting Action Point"
{

    fields
    {
        field(1;"Meeting ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Meeting Register"."Meeting ID";
        }
        field(2;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Task Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Responsibility Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Team,Contractor Team';
            OptionMembers = " ","Internal Team","Contractor Team";
        }
        field(5;"Task Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Responsibility Category"=const("Contractor Team")) "Contractor Resource"."Contractor No." where (Blocked=const(false))
                            else if ("Responsibility Category"=const("Internal Team")) "Internal Project Resource"."Resource No." where (Status=const(Active));

            trigger OnValidate()
            begin
                FnGetResourceName();
            end;
        }
        field(6;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Meeting ID","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ContractorResource: Record "Contractor Resource";
        InternalProjectResource: Record "Internal Project Resource";

    local procedure FnGetResourceName()
    begin
         ContractorResource.Reset;
         ContractorResource.SetRange(ContractorResource."No.","Task Owner ID");
         if ContractorResource.FindSet then begin
           Name:=ContractorResource.Name;
         end;

        InternalProjectResource.Reset;
        InternalProjectResource.SetRange(InternalProjectResource."Resource No.","Task Owner ID");
        if InternalProjectResource.FindSet then begin
          Name:=InternalProjectResource.Name;
          end;
    end;
}

