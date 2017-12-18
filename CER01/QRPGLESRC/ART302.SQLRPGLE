     h nomain

      /copy qprotosrc,ARTICLE

     d savInfo         s           1520    varying
     d savId           s              6
      *=============================================
     PGetArtInfo       B                     export
     DGetArtInfo       PI          1520
     D P_ARID                         6A    value
      /free
         if P_arid <> savId;
           savid = p_arid;
           exec sql select artinf into :savinfo
              from artiinf
              where arid = :savid;
         endif;

         return %trim(savinfo);
      /end-free
     pGetArtInfo       e
