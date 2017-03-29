# Generate list of all registered ActiveRecord models and subtract out those that we won't ever need to associate with
# a user permission.
DocCenter::Application.config.role_models =
  ActiveRecord::Base.connection.tables.collect{|t| t.underscore.singularize.camelize} -
    %w{
        SchemaMigration
        UsersRole
        ActiveAdminComment
        RichRichFile
        FriendlyIdSlug
        Version
        ChannelPartnersFeature
        PgSearchDocument
        ChannelPartnersChannelSpecificState
        AppSetting
        AutoSafe
        ChannelPartnersChannelSpecificContent
        ChannelPartnersHotfix
        ChannelPartnersUser
        ChannelSpecificContent
        ChannelSpecificState
        CustomLink
        OpenidAssociation
        OpenIdUrl
        OpenidNonce
        ReadMark
        TagDescription
        Tagging
        Update
        UsersMailingList
        } +
    %w{all}

DocCenter::Application.config.cancan_actions = %w{index read create update destroy manage}

STOPWORDS = %w{ a
able
about
above
abst
accordance
according
accordingly
across
act
actually
added
adj
affected
affecting
affects
after
afterwards
again
against
ah
all
almost
alone
along
already
also
although
always
am
among
amongst
an
and
announce
another
any
anybody
anyhow
anymore
anyone
anything
anyway
anyways
anywhere
apparently
approximately
are
aren
arent
arise
around
as
aside
ask
asking
at
auth
available
away
awfully
b
back
be
became
because
become
becomes
becoming
been
before
beforehand
begin
beginning
beginnings
begins
behind
being
believe
below
beside
besides
between
beyond
biol
both
brief
briefly
but
by
c
ca
came
can
cannot
can't
cause
causes
certain
certainly
co
com
come
comes
contain
containing
contains
could
couldnt
d
date
did
didn't
different
do
does
doesn't
doing
done
don't
down
downwards
due
during
e
each
ed
edu
effect
eg
eight
eighty
either
else
elsewhere
end
ending
enough
especially
et
et-al
etc
even
ever
every
everybody
everyone
everything
everywhere
ex
except
f
far
few
ff
fifth
first
five
fix
followed
following
follows
for
former
formerly
forth
found
four
from
further
furthermore
g
gave
get
gets
getting
give
given
gives
giving
go
goes
gone
got
gotten
h
had
happens
hardly
has
hasn't
have
haven't
having
he
hed
hence
her
here
hereafter
hereby
herein
heres
hereupon
hers
herself
hes
hi
hid
him
himself
his
hither
home
how
howbeit
however
hundred
i
id
ie
if
i'll
im
immediate
immediately
importance
important
in
inc
indeed
index
information
instead
into
invention
inward
is
isn't
it
itd
it'll
its
itself
i've
j
just
k
keep
keeps
kept
kg
km
know
known
knows
l
largely
last
lately
later
latter
latterly
least
less
lest
let
lets
like
liked
likely
line
little
'll
look
looking
looks
ltd
m
made
mainly
make
makes
many
may
maybe
me
mean
means
meantime
meanwhile
merely
mg
might
million
miss
ml
more
moreover
most
mostly
mr
mrs
much
mug
must
my
myself
n
na
name
namely
nay
nd
near
nearly
necessarily
necessary
need
needs
neither
never
nevertheless
new
next
nine
ninety
no
nobody
non
none
nonetheless
noone
nor
normally
nos
not
noted
nothing
now
nowhere
o
obtain
obtained
obviously
of
off
often
oh
ok
okay
old
omitted
on
once
one
ones
only
onto
or
ord
other
others
otherwise
ought
our
ours
ourselves
out
outside
over
overall
owing
own
p
page
pages
part
particular
particularly
past
per
perhaps
placed
please
plus
poorly
possible
possibly
potentially
pp
predominantly
present
previously
primarily
probably
promptly
proud
provides
put
q
que
quickly
quite
qv
r
ran
rather
rd
re
readily
really
recent
recently
ref
refs
regarding
regardless
regards
related
relatively
research
respectively
resulted
resulting
results
right
run
s
said
same
saw
say
saying
says
sec
section
see
seeing
seem
seemed
seeming
seems
seen
self
selves
sent
seven
several
shall
she
shed
she'll
shes
should
shouldn't
show
showed
shown
showns
shows
significant
significantly
similar
similarly
since
six
slightly
so
some
somebody
somehow
someone
somethan
something
sometime
sometimes
somewhat
somewhere
soon
sorry
specifically
specified
specify
specifying
still
stop
strongly
sub
substantially
successfully
such
sufficiently
suggest
sup
sure
to
the
this
that
that'll
that's
there
there's
there
they'd
they'll
they're
they've
was
wasn't
we
we'd
we'll
were
we're
weren't
what
what'd
what's
when
when'd
when'll
when's
where
where'd
where'll
where's
who
who'd
who'll
who's
why'd
why'll
why's
won't
would've
wouldn't
with
you
you'd
you'll
you're
you've
}
