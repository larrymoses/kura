#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72380 "Maintenance Budget Ceilings Al"
{
    // Caption = 'Budget Ceilings';
    // PageType = ListPart;
    // SourceTable = "Road WorkPlan Package";

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Group)
    //         {
    //             field("Budget Entry N o";"Budget Entry No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'No.';
    //             }
    //             field("Package Nam e";"Package Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Description';
    //             }
    //             field("Road Cod e";"Road Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //             }
    //             field("Road Section No .";"Road Section No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Works Categor y";"Road Works Category")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Section Nam e";"Section Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Constituency I D";"Constituency ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Region I D";"Region ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("County I D";"County ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("BoQ Template Cod e";"BoQ Template Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Road Project Categor y";"Road Project Category")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Pavement Surface Typ e";"Pavement Surface Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Start Chainag e";"Start Chainage")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("End Chainag e";"End Chainage")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Workplanned Length (Km )";"Workplanned Length (Km)")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Directorate I D";"Directorate ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Department I D";"Department ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Budget Cos t";"Total Budget Cost")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         group("&Line Function")
    //         {
    //             Caption = '&Line Function';
    //             Visible = false;
    //             action(Tasks)
    //             {
    //                 ApplicationArea = Basic;
    //                 Ellipsis = true;
    //                 Image = TaskList;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 RunObject = Page "Work Plan Tasks";
    //                 RunPageLink = "Road Work Program  = D"=field("Road Work Program ID"),
    //                               "Package N = ."=field("Budget Entry No");
    //             }
    //             action("Planning Lines")
    //             {
    //                 ApplicationArea = Basic;
    //                 Ellipsis = true;
    //                 Image = Planning;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 RunObject = Page "WP Plan Lines";
    //                 RunPageLink = "Road Work Program  = D"=field("Road Work Program ID"),
    //                               "Budget Entry  = o"=field("Budget Entry No");
    //             }
    //         }
    //     }
    // }
}

