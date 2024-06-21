#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50110 "pageextension50110" extends "Demand Overview" 
{
    layout
    {

        //Unsupported feature: Code Modification on "DemandNoCtrl(Control 45).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CASE DemandType OF
              DemandType::Sales:
                BEGIN
            #4..36
                END;
              DemandType::Jobs:
                BEGIN
                  Job.SETRANGE(Status,Job.Status::Open);
                  JobList.SETTABLEVIEW(Job);
                  JobList.LOOKUPMODE := TRUE;
                  IF JobList.RUNMODAL = ACTION::LookupOK THEN BEGIN
            #44..59
                  EXIT(FALSE);
                END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..39
                  Job.SETRANGE(Status,Job.Status::"Completed/Under DLP");
            #41..62
            */
        //end;
    }
}

