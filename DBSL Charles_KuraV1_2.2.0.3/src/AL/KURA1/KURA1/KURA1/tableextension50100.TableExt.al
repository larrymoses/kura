#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50100 "tableextension50100" extends "Workflow User Group" 
{
    fields
    {
        field(3;"Approval Stage";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"HR Position";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions."Position ID";
        }
        field(5;"Region Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(6;"Project Based";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project ID";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.","Project ID");
                if ObjJob.FindSet then
                  "Project Name":=ObjJob.Description;
            end;
        }
        field(8;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        ObjJob: Record Job;
}

