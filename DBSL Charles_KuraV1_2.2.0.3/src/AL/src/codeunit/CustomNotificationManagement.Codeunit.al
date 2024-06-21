#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70002 "Custom Notification Management"
{

    trigger OnRun()
    begin
        FnFlagUserIgnoredIfPastTwoWeeks(ICTHelpdesk."Job No.");
    end;

    var
        ICTHelpdesk: Record "ICT Helpdesk";


    procedure FnFlagUserIgnoredIfPastTwoWeeks(JobNo: Code[40])
    var
        ICTHDeskSetUp: Record "ICT Officers Category Mapping";
        ObjICTHDesk: Record "ICT Helpdesk";
    begin
         ObjICTHDesk.Reset;
         ObjICTHDesk.SetRange(ObjICTHDesk."Job No.",JobNo);
         if ObjICTHDesk.FindSet then begin
          ICTHDeskSetUp.Get;
          if ((ObjICTHDesk.Status = ObjICTHDesk.Status::Resolved) and (ObjICTHDesk."Requester Feedback" = ''))then begin
            if CalcDate(ICTHDeskSetUp."User Feedbback Duration",ObjICTHDesk."Attended Date") = Today then begin
              ObjICTHDesk."Requester Feedback":='The system has checked this issue'+' '+JobNo+' '+'because the user has declined to give feedback';
               Message(ObjICTHDesk."Requester Feedback");
               ObjICTHDesk.Status := ObjICTHDesk.Status::Resolved;
               ObjICTHDesk.Modify;
              end;
            end;
          end;
    end;
}

