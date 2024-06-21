#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72115 "Road Inv. Condition Survey"
{
    DrillDownPageID = "Road Inventory Cond.  Surveys";
    LookupPageID = "Road Inventory Cond.  Surveys";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            
        }
        field(2; "Document Date"; Date)
        {
            
        }
        field(3; "Survey Type"; Option)
        {
            
            OptionCaption = ' ,Existing Road Network,New Road Link,Project-Based';
            OptionMembers = " ","Existing Road Network","New Road Link","Project-Based";
        }
        field(4; Description; Text[250])
        {
            
        }
        field(5; "Service Type"; Option)
        {
            
            OptionCaption = ' ,OutSourced,Internal';
            OptionMembers = " ",OutSourced,Internal;
        }
        field(6; "Project ID"; Code[20])
        {
            
        }
        field(7; "Contract No."; Code[20])
        {
            
        }
        field(8; "Primary Vendor No."; Code[20])
        {
            
        }
        field(9; "Vendor Name"; Text[250])
        {
            
        }
        field(10; "Project Start Date"; Date)
        {
            
        }
        field(11; "Project End Date"; Date)
        {
            
        }
        field(12; "Target Road Inventory Type"; Option)
        {
            
            OptionCaption = ' ,Both Existing/New Roads,New Roads Only';
            OptionMembers = " ","Both Existing/New Roads","New Roads Only";
        }
        field(13; Region; Code[20])
        {   
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));

            trigger OnValidate()
            var
                RespCenter: Record "Responsibility Center";
            begin
                RespCenter.Reset();
                RespCenter.SetRange(Code, Region);
                if RespCenter.Find('-') then
                    "Region Name" := RespCenter.Name;
            end;
        }
        field(14; "Branch/Center"; Code[20])
        {
            
            //    TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Branch));
        }
        field(15; Directorate; Code[20])
        {
            
            //    TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate));
        }
        field(16; Department; Code[20])
        {
            
            //  TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(17; "Approval Status"; Enum "App Status")
        {
            Editable=false;
            // OptionCaption = ' ,Open,Pending Approval,Released';
            // OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(18; Posted; Boolean)
        {
           Editable=false; 
        }
        field(19; "No. of Constituencies"; Integer)
        {
            
            Editable = false;
        }
        field(20; "No.Of Existing Roads"; Integer)
        {
            
            Editable = false;
        }
        field(21; "No. of New Roads"; Integer)
        {
            
            Editable = false;
        }
        field(22; "Created By"; Code[50])
        {
            
            Editable = false;
        }
        field(23; "Created DateTime"; DateTime)
        {
            
            Editable = false;
        }
        field(24; "No. Series"; Code[20])
        {
            
        }
        field(25; "Financial Year"; Code[30])
        {
           TableRelation= "G/L Budget Name";
        }
        field(26; "Region Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Responsibility Center".Name;
        }
        
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        "Approval Status" := "approval status"::Open;
        "Document Date" := WorkDate();
        if "Document No." = '' then begin
            if "Survey Type" = "survey type"::"Existing Road Network" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("RICS Existing Link No");
                NoSeriesManagement.InitSeries(RoadManagementSetup."RICS Existing Link No", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Survey Type" = "survey type"::"New Road Link" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("RICS New Link No");
                NoSeriesManagement.InitSeries(RoadManagementSetup."RICS New Link No", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Survey Type" = "survey type"::"Project-Based" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("RICS Project Based Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."RICS Project Based Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;
    end;
    

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
         DimMgt: Codeunit DimensionManagement;
}

