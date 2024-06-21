#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70122 "Works Category"
{
    DrillDownPageID = "Works Categories";
    LookupPageID = "Works Categories";

    fields
    {
        field(1; "Code"; Code[50])
        {
            
        }
        field(2; "Road Project Category"; Option)
        {
            
            OptionCaption = ',Studies and Surveys,Construction Works,Maintenance Works,Road Construction,Survey/Study,Maintenance';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maintenance Works","Road Construction","Survey/Study","Maintenance";
        }
        field(3; Description; Text[100])
        {
            
        }
        field(4; "Default BoQ Template Code"; Code[50])
        {
            
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = const(BoQ),
                                                                        Blocked = const(false));
        }
        field(5; "Default Directorate"; Code[50])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                Blocked = const(false));
        }
        field(6; "Default Department"; Code[100])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                Blocked = const(false),
                                                                "Direct Reports To" = field("Default Directorate"));
        }
        field(7; "Default Procurement Category"; Code[20])
        {
            
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
        }
        field(8; "Consultancy Project Category"; Option)
        {
            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits,Geotechnical Investigations,Technical Audits,Conditional Surveys,Feasibility Study,Monitoring and Evaluation';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits","Geotechnical Investigations","Technical Audits","Conditional Surveys","Feasibility Study","Monitoring and Evaluation";
        }
        field(9; "G/L Account";Code[20])
        {
            TableRelation ="G/L Account";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ItemCategoryManagement: Codeunit "Works Category Management";
        CyclicInheritanceErr: label 'An item category cannot be a parent of itself or any of its children.';
        DeleteWithChildrenErr: label 'You cannot delete this item category because it has child item categories.';
        DeleteItemInheritedAttributesQst: label 'One or more items belong to item category ''''%1''''.\\Do you want to delete the inherited item attributes for the items in question? ', Comment = '%1 - item category code';
}

