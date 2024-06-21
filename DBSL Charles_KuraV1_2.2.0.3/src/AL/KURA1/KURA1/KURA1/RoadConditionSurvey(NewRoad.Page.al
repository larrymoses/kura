// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 72177 "Road Condition Survey(New Road"
// {
//     PageType = Card;
//     SourceTable = "RICS New Road Link H";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("RICS No."; "RICS No.")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field(Description; Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Service Type"; "Service Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Project ID"; "Project ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Contract No"; "Contract No")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'RICS Contract  No';
//                 }
//                 field("Contractor No"; "Contractor No")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'RICS Contractor No';
//                 }
//                 field("Contractor Name"; "Contractor Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'RICS Contractor Name';
//                     Editable = false;
//                 }
//                 field("No Of Existing Road Links"; "No Of Existing Road Links")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Region Code"; "Region Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Directorate Code"; "Directorate Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Department Code"; "Department Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approval Status"; "Approval Status")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Created By"; "Created By")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Created DateTime"; "Created DateTime")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//             }
//             part(Control20; "RICS New Road Link Line")
//             {
//                 SubPageLink = "RICS No." = field("RICS No.");
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             action("Study Objectives")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = OnlineHelp;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = Page "RICS Study Objectives";
//                 RunPageLink = "RICS No." = field("RICS No.");
//             }
//             action("Import Road Lines")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Import;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = XMLport "Import RICS New Lines";
//             }
//             action("Import Road Sections")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Import;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = XMLport "RICS New Road Sections";
//             }
//             action("Import Pavement Condition Data")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Import;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = XMLport "RICS New Road Pavement";
//             }
//             action("Import Road Facilties")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Import;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = XMLport "RICS New Road Facility";
//             }
//             action("Import Road Environs")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Import;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = XMLport "RICS New Road Environ";
//             }
//             action("Regions Covered")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Link;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = Page "RICS Counties";
//                 RunPageLink = "RICS No." = field("RICS No.");
//                 Visible = false;
//             }
//             action("Suggest Road Link Information")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Suggest;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     //Delete Existing LInes
//                     RICSExistingRoadLinkLine.Reset;
//                     RICSExistingRoadLinkLine.SetRange(RICSExistingRoadLinkLine."RICS No.", "RICS No.");
//                     if RICSExistingRoadLinkLine.FindSet then
//                         RICSExistingRoadLinkLine.DeleteAll;

//                     //Insert RICS Existing Road Lins from Road Inventory Based on Region Code
//                     with RICSCounty do begin
//                         repeat
//                             RoadInventory.Reset;
//                             RoadInventory.SetRange(RoadInventory."Primary Region ID", RICSCounty."Region Code");
//                             if RoadInventory.FindSet then
//                                 repeat
//                                     RICSExistingRoadLinkLine.Init;
//                                     RICSExistingRoadLinkLine."RICS No." := "RICS No.";
//                                     RICSExistingRoadLinkLine."General Road Surface Condition" := RoadInventory."General Road Surface Condition";
//                                     RICSExistingRoadLinkLine."New Gen. Road Surf. Condition" := RoadInventory."General Road Surface Condition";
//                                     RICSExistingRoadLinkLine."Road Code" := RoadInventory."Road Code";
//                                     RICSExistingRoadLinkLine."Entry No" := RICSExistingRoadLinkLine."Entry No" + 100;
//                                     RICSExistingRoadLinkLine."Road Class ID" := RoadInventory."Road Class ID";
//                                     RICSExistingRoadLinkLine."Link Name" := RoadInventory."Link Name";
//                                     RICSExistingRoadLinkLine."New Gen. Road Surf. Condition" := RoadInventory."General Road Surface Condition";
//                                     RICSExistingRoadLinkLine.Blocked := RoadInventory.Blocked;
//                                     RICSExistingRoadLinkLine."New Road Class ID" := RoadInventory."Road Class ID";
//                                     RICSExistingRoadLinkLine."Primary County ID" := RoadInventory."Primary County ID";
//                                     RICSExistingRoadLinkLine."Primary Region ID" := RoadInventory."Primary Region ID";
//                                     RICSExistingRoadLinkLine."Start Chainage(KM)" := RoadInventory."Start Chainage(KM)";
//                                     RICSExistingRoadLinkLine."End  Chainage(KM)" := RoadInventory."End Chainage(KM)";
//                                     RICSExistingRoadLinkLine."Total Road Length (KMs)" := RoadInventory."Total Section Length (KMs)";
//                                     RICSExistingRoadLinkLine."Paved Road Length %" := RoadInventory."Paved Road Length %";
//                                     RICSExistingRoadLinkLine."Paved Road Length (Km)" := RoadInventory."Paved Road Length (Km)";
//                                     //IF NOT RICSExistingRoadLinkLine.GET(RICSExistingRoadLinkLine."RICS No.",RICSExistingRoadLinkLine."Road Code") THEN
//                                     RICSExistingRoadLinkLine.Insert(true)
//                                   until RoadInventory.Next = 0;
//                         until RICSCounty.Next = 0;
//                     end;

//                     //Delete Existing RICS Sections
//                     //      RICSExistingRoadSection.RESET;
//                     //      RICSExistingRoadSection.SETRANGE(RICSExistingRoadSection."RICS No.","RICS No.");
//                     //      IF RICSExistingRoadSection.FINDSET THEN
//                     //      RICSExistingRoadSection.DELETEALL;

//                     //Insert Sections
//                     RICSExistingRoadLinkLine.Reset;
//                     RICSExistingRoadLinkLine.SetRange(RICSExistingRoadLinkLine."RICS No.", "RICS No.");
//                     if RICSExistingRoadLinkLine.FindSet then begin
//                         RoadSection.Reset;
//                         RoadSection.SetRange(RoadSection."Road Code", RICSExistingRoadLinkLine."Road Code");
//                         if RoadSection.FindSet(true) then
//                             repeat
//                                 RICSExistingRoadSection.Init;
//                                 RICSExistingRoadSection."RICS No." := "RICS No.";
//                                 RICSExistingRoadSection."Road Code" := RICSExistingRoadLinkLine."Road Code";
//                                 RICSExistingRoadSection."Road Section No." := RoadSection."Road Section No.";
//                                 RICSExistingRoadSection."Section Name" := RoadSection."Section Name";
//                                 RICSExistingRoadSection."Primary Constituency ID" := RoadSection."Primary Constituency ID";
//                                 RICSExistingRoadSection."Primary County ID" := RoadSection."Primary County ID";
//                                 RICSExistingRoadSection."Primary Region ID" := RoadSection."Primary Region ID";
//                                 RICSExistingRoadSection."Start Chainage(KM)" := RoadSection."Start Chainage(KM)";
//                                 RICSExistingRoadSection."End Chainage(KM)" := RoadSection."End Chainage(KM)";
//                                 RICSExistingRoadSection."Total Road Length (KMs)" := RoadSection."Total Road Length (KMs)";
//                                 //          IF NOT RICSExistingRoadSection.GET(RICSExistingRoadSection."RICS No.",RICSExistingRoadSection."Road Code",
//                                 //          RICSExistingRoadSection."Road Section No.") THEN
//                                 RICSExistingRoadSection.Insert(true)
//                                until RoadSection.Next = 0;
//                     end;


//                     //Delete Pavement Info
//                     //      RICSExistingRoadPavement.RESET;
//                     //      RICSExistingRoadPavement.SETRANGE(RICSExistingRoadPavement."RICS No.","RICS No.");
//                     //      IF RICSExistingRoadPavement.FINDSET THEN
//                     //      RICSExistingRoadPavement.DELETEALL;

//                     //Insert Pavement Info
//                     RICSExistingRoadLinkLine.Reset;
//                     RICSExistingRoadLinkLine.SetRange(RICSExistingRoadLinkLine."RICS No.", "RICS No.");
//                     if RICSExistingRoadLinkLine.FindSet then begin
//                         PavementSurfaceEntry.Reset;
//                         PavementSurfaceEntry.SetRange(PavementSurfaceEntry."Road Code", RICSExistingRoadLinkLine."Road Code");
//                         if PavementSurfaceEntry.FindSet then
//                             repeat
//                                 RICSExistingRoadPavement."RICS No." := "RICS No.";
//                                 RICSExistingRoadPavement."Road Code" := PavementSurfaceEntry."Road Code";
//                                 RICSExistingRoadPavement."Road Section No." := PavementSurfaceEntry."Road Section No.";
//                                 RICSExistingRoadPavement."Pavement Surface Type" := PavementSurfaceEntry."Pavement Surface Type";
//                                 RICSExistingRoadPavement."Pavement Category" := PavementSurfaceEntry."Pavement Category";
//                                 RICSExistingRoadPavement."Start Chainage(KM)" := PavementSurfaceEntry."Start Chainage";
//                                 RICSExistingRoadPavement."End Chainage(KM)" := PavementSurfaceEntry."End Chainage";
//                                 RICSExistingRoadPavement."Road Length (Kms)" := PavementSurfaceEntry."Road Length (Kms)";
//                                 RICSExistingRoadPavement."Road Surface Condition" := PavementSurfaceEntry."Road Surface Condition";
//                                 RICSExistingRoadPavement."Entry No" := RICSExistingRoadPavement."Entry No" + 100;
//                                 //          IF NOT RICSExistingRoadPavement.GET(RICSExistingRoadPavement."RICS No.") THEN
//                                 RICSExistingRoadPavement.Insert(true);

//                             until PavementSurfaceEntry.Next = 0;
//                     end;

//                     //Delete Facility Data
//                     //       RICSExistingRoadPavement.RESET;
//                     //       RICSExistingRoadPavement.SETRANGE(RICSExistingRoadPavement."RICS No.","RICS No.");
//                     //       IF RICSExistingRoadPavement.FINDSET THEN
//                     //         RICSExistingRoadPavement.DELETEALL;

//                     //Insert Facility Data
//                     RICSExistingRoadLinkLine.Reset;
//                     RICSExistingRoadLinkLine.SetRange(RICSExistingRoadLinkLine."RICS No.", "RICS No.");
//                     if RICSExistingRoadLinkLine.FindSet then begin
//                         RoadFacilityItem.Reset;
//                         RoadFacilityItem.SetRange(RoadFacilityItem."Road Code", RICSExistingRoadLinkLine."Road Code");
//                         if RoadFacilityItem.FindSet then
//                             repeat
//                                 RICSExistingRoadFacility.Init;
//                                 RICSExistingRoadFacility."RICS No." := "RICS No.";
//                                 RICSExistingRoadFacility."Entry Type" := RICSExistingRoadFacility."entry type"::Existing;
//                                 RICSExistingRoadFacility."Facility  No." := RoadFacilityItem."Facility  No.";
//                                 RICSExistingRoadFacility."Road Code" := RoadFacilityItem."Road Code";
//                                 RICSExistingRoadFacility."Road Section No." := RoadFacilityItem."Road Section No.";
//                                 RICSExistingRoadFacility."Road Facility Category" := RoadFacilityItem."Road Facility Category";
//                                 RICSExistingRoadFacility."Road Facility Type" := RoadFacilityItem."Road Facility Type";
//                                 RICSExistingRoadFacility."Road Facility SubType" := RoadFacilityItem."Road Facility SubType";
//                                 RICSExistingRoadFacility.Description := RoadFacilityItem.Description;
//                                 RICSExistingRoadFacility."Facility Label" := RoadFacilityItem."Facility Label";
//                                 RICSExistingRoadFacility."Facility Location" := RoadFacilityItem."Facility Location";
//                                 RICSExistingRoadFacility."Material Type" := RoadFacilityItem."Material Type";
//                                 RICSExistingRoadFacility."General Facility Condition" := RoadFacilityItem."General Facility Condition";
//                                 RICSExistingRoadFacility."Construction Project ID" := RoadFacilityItem."Construction Project ID";
//                                 RICSExistingRoadFacility."Construction Date" := RoadFacilityItem."Construction Date";
//                                 RICSExistingRoadFacility."Last Maintenance Date" := RoadFacilityItem."Last Maintenance Date";
//                                 RICSExistingRoadFacility.Blocked := false;
//                                 //IF NOT RICSExistingRoadFacility.GET("RICS No.") THEN
//                                 RICSExistingRoadFacility.Insert
//                              until RoadFacilityItem.Next = 0;
//                     end;
//                     //Delete Environ Data
//                     //       RICSExistingRoadEnviron.RESET;
//                     //       RICSExistingRoadEnviron.SETRANGE(RICSExistingRoadEnviron."RICS No.","RICS No.");
//                     //       IF RICSExistingRoadEnviron.FINDSET THEN
//                     //         RICSExistingRoadEnviron.DELETEALL;

//                     //Insert Road Environs
//                     RICSExistingRoadLinkLine.Reset;
//                     RICSExistingRoadLinkLine.SetRange(RICSExistingRoadLinkLine."RICS No.", "RICS No.");
//                     if RICSExistingRoadLinkLine.FindSet then begin
//                         RoadEnvironEntry.Reset;
//                         RoadEnvironEntry.SetRange(RoadEnvironEntry."Road Code", RICSExistingRoadLinkLine."Road Code");
//                         if RoadEnvironEntry.FindSet then
//                             repeat
//                                 if RoadEnvironEntry.FindLast then
//                                     RICSExistingRoadEnviron.Init;
//                                 RICSExistingRoadEnviron.TransferFields(RoadEnvironEntry);
//                                 RICSExistingRoadEnviron."RICS No." := "RICS No.";
//                                 //  RICSExistingRoadEnviron."Entry No":=RoadEnvironEntry."Environ ID"+1000;
//                                 RICSExistingRoadEnviron.Insert(true);
//                             until RoadEnvironEntry.Next = 0;
//                     end;
//                 end;
//             }
//             action("Send Approval Request")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = SendApprovalRequest;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;

//                 trigger OnAction()
//                 begin
//                     Message('Approval for this RICS has been sent successfully');
//                 end;
//             }
//             action("Cancel Approval Request")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = CancelApprovalRequest;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;

//                 trigger OnAction()
//                 begin
//                     Message('Approval for this RICS has been canceled successfully');
//                 end;
//             }
//             action(Approvals)
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Approvals;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;

//                 trigger OnAction()
//                 begin
//                     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
//                 end;
//             }
//             action("Post(F9)")
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = PostDocument;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;

//                 trigger OnAction()
//                 begin
//                     //TESTFIELD("Approval Status","Approval Status"::Released);
//                     RICSNewRoadLinkLine.Reset;
//                     RICSNewRoadLinkLine.SetRange(RICSNewRoadLinkLine."RICS No.", "RICS No.");
//                     if not RICSNewRoadLinkLine.FindFirst then
//                         Error('Please populate lines first');

//                     RICSNewRoadLinkLine.Reset;
//                     RICSNewRoadLinkLine.SetRange(RICSNewRoadLinkLine."RICS No.", "RICS No.");
//                     if RICSNewRoadLinkLine.FindSet then
//                         repeat
//                             RoadInventory.Init;
//                             RoadInventory."Road Code" := RICSNewRoadLinkLine."Road Code";
//                             RoadInventory."Link Name" := RICSNewRoadLinkLine."Link Name";
//                             RoadInventory."Road Class ID" := RICSNewRoadLinkLine."Road Class ID";
//                             RoadInventory."Primary County ID" := RICSNewRoadLinkLine."Primary County ID";
//                             RoadInventory."Primary Region ID" := RICSNewRoadLinkLine."Primary Region ID";
//                             if not RoadInventory.Get(RICSNewRoadLinkLine."Road Code") then
//                                 RoadInventory.Insert(true)
//                             else
//                                 Error('The Road Link %1 already exists', RICSNewRoadLinkLine."Link Name");
//                         until RICSNewRoadLinkLine.Next = 0;
//                 end;
//             }
//             action(Print)
//             {
//                 ApplicationArea = Basic;
//                 Ellipsis = true;
//                 Image = Print;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//             }
//         }
//     }

//     var
//         RICSCounty: Record "RICS County";
//         RoadInventory: Record "Road Inventory";
//         RICSExistingRoadLinkLine: Record "RICS Existing Road Link Line";
//         RICSExistingRoadPavement: Record "RICS Existing Road Pavement";
//         RICSExistingRoadFacility: Record "RICS Existing Road Facility";
//         RICSExistingRoadEnviron: Record "RICS Existing Road Environ";
//         RICSExistingRoadSection: Record "RICS Existing Road Section";
//         RoadSection: Record "Road Section";
//         PavementSurfaceEntry: Record "Pavement Surface Entry";
//         RoadFacilityItem: Record "Road Facility Item";
//         RoadEnvironEntry: Record "Road Environ Entry";
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//         RICSNewRoadLinkH: Record "RICS New Road Link H";
//         RICSNewRoadLinkLine: Record "RICS New Road Link Line";
// }

