# NAME

RT-Extension-InlineAudioVideoAttachments - Display audio/video attachments inline

# DESCRIPTION

Displays audio and/or video attachments with HTML audio/video player. 

# RT VERSION

Works with RT 4.4 or greater

# INSTALLATION

- `perl Makefile.PL`
- `make`
- `make install`

    May need root permissions

- Edit your `/opt/rt4/etc/RT_SiteConfig.pm`

    If you are using RT 4.2 or greater, add this line:

        Plugin('RT::Extension::InlineAudioVideoAttachments');

    For RT 4.0, add this line:

        Set(@Plugins, qw(RT::Extension::InlineAudioVideoAttachments));

    or add `RT::Extension::InlineAudioVideoAttachments` to your existing `@Plugins` line.

- Clear your mason cache

        rm -rf /opt/rt4/var/mason_data/obj

- Restart your webserver

# AUTHOR

G�rald S�drati-Dinet <gibus@easter-eggs.com>

# REPOSITORY

[https://github.com/gibus/RT-Extension-InlineAudioVideoAttachments](https://github.com/gibus/RT-Extension-InlineAudioVideoAttachments)

# BUGS

All bugs should be reported via email to

[bug-RT-Extension-InlineAudioVideoAttachments@rt.cpan.org](mailto:bug-RT-Extension-InlineAudioVideoAttachments@rt.cpan.org)

or via the web at

[rt.cpan.org](http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-InlineAudioVideoAttachments).

# LICENSE AND COPYRIGHT

This software is Copyright (c) 2018 by G�rald S�drati-Dinet, Easter-Eggs

This is free software, licensed under:

The GNU General Public License, Version 3, June 2007
