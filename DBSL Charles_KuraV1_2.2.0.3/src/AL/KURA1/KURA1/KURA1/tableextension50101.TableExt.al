#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50101 "tableextension50101" extends "Workflow User Group Member" 
{
    fields
    {
        field(4;"HR Position";Code[50])
        {
            
            TableRelation = Positions."Position ID";
        }
        field(5;"Region Code";Code[50])
        {
            
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(6;"Alternative Station";Code[50])
        {
            
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(7;"Project Role";Code[20])
        {
            
            TableRelation = "Internal Project Resource"."Role Code" where ("Project ID"=field("Project ID"));
        }
        field(8;"Project ID";Code[100])
        {
            
            Editable = false;
            TableRelation = Job."No.";
        }
        field(9;"Project Based";Boolean)
        {
            
        }
        field(10; Delegation; Boolean)
        {
            
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Workflow User Group Code","User Name"(Key)".
        // 
        // key(Key1;"Workflow User Group Code","HR Position","Project Role")
        // {
        // Clustered = true;
        // }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //begin
        /*
        WorkflowUserGroup.RESET;
        WorkflowUserGroup.SETRANGE(WorkflowUserGroup.Code,"Workflow User Group Code");
        IF WorkflowUserGroup.FINDSET THEN BEGIN
           "Region Code":=WorkflowUserGroup."Region Code";
           "Project ID":=WorkflowUserGroup."Project ID";
            "Project Based":=WorkflowUserGroup."Project Based";
          END;
        */
    //end;

    var
        WorkflowUserGroup: Record "Workflow User Group";
}

